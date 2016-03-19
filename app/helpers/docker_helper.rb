module DockerHelper
  DOCKER_LOG_LINE_TIMESTAMP = /(?<timestamp>\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d+Z)/

  def tail_container_logs(container, since = nil)
    payload = {stdout: true, timestamps: true, since: since}.keep_if(&:present?)

    line = container.logs(payload).lines.last.strip

    timestamp = line.match(DOCKER_LOG_LINE_TIMESTAMP) { |m| m[:timestamp] }

    content_tag(:div, data: {timestamp: timestamp}) { line }
  end
end

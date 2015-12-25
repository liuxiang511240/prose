module ApplicationHelper
  EMPTY_STRING = ''.freeze

  def timeago(time, options = {})
    options[:class] = options[:class].blank? ? 'timeago' : [options[:class], 'timeago'].join(' ')
    options.merge!(title: time.iso8601)
    content_tag(:abbr, EMPTY_STRING, class: options[:class], title: time.iso8601) if time
  end
end

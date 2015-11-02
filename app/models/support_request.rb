class SupportRequest < ActiveRecord::Base
  include Searchable

  # TODO: multiple validations on one line?
  validates :name, presence: true
  validates :email, presence: true


  def self.search_for(query)
    search(query, :name, :email, :message)
  end

  # Returns the opposite value of 'done', for use in the toggle field
  def toggle_status
    self.done ? false : true
  end

  # Returns the opposite of what the 'done' field is currently set to.
  def toggle_status_display
    self.done ? "Done" : "Not done"
  end

  # Returns a truncated version of the message for display on the index page.
  def message_short(max_length)
    if self.message && self.message.length > max_length
      self.message[0..max_length] + "..."
    else
      self.message
    end
  end
end

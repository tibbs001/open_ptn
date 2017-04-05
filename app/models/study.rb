class Study < ActiveRecord::Base
  has_many :study_attachments, :dependent => :destroy
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def initialize(params = {})
    file = params.delete(:file)
    files = params.delete(:files)
    super
    if files.blank?
      if !file.blank?
        self.attachments << StudyAttachment.create_from(file) if file
      end
    else
      files.each{|file|
        self.attachments << StudyAttachment.create_from(file)
      }
    end
    self
  end

  def update(params = {})
    self.study_attachments = []
    self.attachments << StudyAttachment.create_from(file) if file
    super
    self
  end

  def linkable_url
    return nil if self.url.blank?
    if self.url.match(/^http:\/\//) or self.url.match(/^https:\/\//)
      self.url
    else
      "http://#{self.url}"
    end
  end

  def attachment
    attachments.first
  end

  def attachments
    study_attachments
  end

end


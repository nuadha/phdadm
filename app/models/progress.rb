class Progress < ActiveRecord::Base
  attr_accessible :completedate, :milestone, :plandate, :user_id, :name, :content_type, :data, :uploaded_pdf
  attr_reader :uploaded_pdf
  default_scope :order => 'user_id'
  belongs_to :user
  
  validates :content_type, :format => {:with => %r{\w+.pdf},
                                       :message => "--- you can only upload pdf files"}
  
  validates :user_id, :milestone, :plandate, :presence => true
  
  
  
  def uploaded_pdf=(pdf_field)
    self.name = base_part_of(pdf_field.original_filename)
    self.content_type = pdf_field.content_type.chomp
    self.data = pdf_field.read
  end
  
    def base_part_of(file_name)
      File.basename(file_name).gsub(/[^\w._-]/, '')
    end
end

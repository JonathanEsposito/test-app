class Photo < ActiveRecord::Base
#  acts_as_fleximage :image_directory => 'public/images/uploaded_photos'

  belongs_to :album

  has_many :comments

  has_many :tags

  PATH = "public/images/photos/"

  def file=(photo)
    unless photo.blank?
      base_name = base_part_of(photo.original_filename)
      self.extension = base_name.split('.').last
      new_path = "#{Time.now.strftime("%Y%m%d%H%M%S")}#{random_hex(2)}.#{self.extension}"
      while File.exists? "#{PATH}#{new_path}"
        new_path = "#{Time.now.strftime("%Y%m%d%H%M%S")}#{random_hex(2)}.#{self.extension}"
      end
      self.path = "photos/#{new_path}"
      new_file = File.new("#{PATH}#{new_path}", "w+")
      new_file.write photo.read
      new_file.close
    end
  end

  private

  def base_part_of(file_name)
    name = File.basename(file_name)
    name.gsub(/[^\w ._-]/, '' )
  end

  RAND_TOKENS = %w( a b c d e f 0 1 2 3 4 5 6 7 8 9 )

  def random_token_array(len, tokens)
    Array.new(len).map { |i| tokens[rand(tokens.size)] }
  end

  def random_hex(len)
    random_token_array(len, RAND_TOKENS).join('')
  end

end

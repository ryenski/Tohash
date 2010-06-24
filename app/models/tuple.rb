class Tuple < ActiveRecord::Base
  
  serialize :content
  
  before_save :convert_hashes
  def convert_hashes
    self.md5 = to_md5
    self.sha1 = to_sha1
    self.sha2 = to_sha2
  end
  
  def to_md5
    self.class.md5(content.to_yaml)
  end
  
  def to_sha1
    self.class.sha1(content.to_yaml)
  end
  
  def to_sha2
    self.class.sha2(content.to_yaml)
  end
  
  def to_param
    sha2
  end
  
  def to_csv
    r = []
    for k,v in content
      r << [k,v].join(",")
    end if content.is_a?(Hash)
    r.join("\n")
  end
  
  class << self
    def sha2(str)
      Digest::SHA2.hexdigest(str)
    end
    
    def sha1(str)
      Digest::SHA1.hexdigest(str)
    end
    
    def md5(str)
      Digest::MD5.hexdigest(str)
    end
  end
end

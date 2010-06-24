module HomeHelper
  def sample_hash_url(format=nil)
    %Q{56bbdda335500fc38e1c10458f2e5865e1927c5978e9b0a3667db67196fc77dc#{".#{format}" if format}}
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class TupleTest < ActiveSupport::TestCase
  
  def setup
    @tuple = Tuple.new(:content => {:first_item => "Foobar"})
  end
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "it should be valid" do
    assert @tuple.valid?
  end
  
  test "hashes should be blank" do
    assert_nil @tuple.md5
    assert_nil @tuple.sha1
    assert_nil @tuple.sha2
  end
  
  test "it should hash the md5" do
    @tuple.save
    assert_equal 32, @tuple.md5.size
  end
  
  test "it should hash the SHA1" do
    @tuple.save
    assert_equal 40, @tuple.sha1.size
  end
  
  test "it should hash the SHA2" do
    @tuple.save
    assert_equal 64, @tuple.sha2.size
  end
end

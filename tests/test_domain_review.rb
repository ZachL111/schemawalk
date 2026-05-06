require 'minitest/autorun'
require 'domain_review'

class DomainReviewTest < Minitest::Test
  def test_domain_lane
    item = Schemawalk::DomainReview.new(signal: 50, slack: 49, drag: 27, confidence: 51)
    assert_equal 119, Schemawalk.domain_review_score(item)
    assert_equal "watch", Schemawalk.domain_review_lane(item)
  end
end

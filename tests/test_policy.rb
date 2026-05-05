require 'minitest/autorun'
require 'policy'

class PolicyTest < Minitest::Test
  def test_fixture_decisions
    signal_case_1 = Schemawalk::Signal.new(demand: 76, capacity: 75, latency: 23, risk: 20, weight: 13)
    assert_equal 47, Schemawalk.score(signal_case_1)
    assert_equal 'review', Schemawalk.classify(signal_case_1)
    signal_case_2 = Schemawalk::Signal.new(demand: 67, capacity: 94, latency: 22, risk: 7, weight: 6)
    assert_equal 115, Schemawalk.score(signal_case_2)
    assert_equal 'review', Schemawalk.classify(signal_case_2)
    signal_case_3 = Schemawalk::Signal.new(demand: 94, capacity: 105, latency: 24, risk: 11, weight: 6)
    assert_equal 144, Schemawalk.score(signal_case_3)
    assert_equal 'review', Schemawalk.classify(signal_case_3)
  end
end

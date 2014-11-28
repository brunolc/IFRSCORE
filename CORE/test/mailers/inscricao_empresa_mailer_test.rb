require 'test_helper'

class InscricaoEmpresaMailerTest < ActionMailer::TestCase
  test "realizada" do
    mail = InscricaoEmpresaMailer.realizada
    assert_equal "Realizada", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

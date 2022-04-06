require "test_helper"

class DnaSequencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dna_sequence = dna_sequences(:one)
  end

  test "should get index" do
    get dna_sequences_url, as: :json
    assert_response :success
  end

  test "should create dna_sequence" do
    assert_difference("DnaSequence.count") do
      post dna_sequences_url, params: { dna_sequence: { category: @dna_sequence.category, dna: @dna_sequence.dna } }, as: :json
    end

    assert_response :created
  end

  test "should show dna_sequence" do
    get dna_sequence_url(@dna_sequence), as: :json
    assert_response :success
  end

  test "should update dna_sequence" do
    patch dna_sequence_url(@dna_sequence), params: { dna_sequence: { category: @dna_sequence.category, dna: @dna_sequence.dna } }, as: :json
    assert_response :success
  end

  test "should destroy dna_sequence" do
    assert_difference("DnaSequence.count", -1) do
      delete dna_sequence_url(@dna_sequence), as: :json
    end

    assert_response :no_content
  end
end

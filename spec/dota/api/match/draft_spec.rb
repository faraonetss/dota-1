describe Dota::API::Match::Draft do
  let(:draft) do
    VCR.use_cassette("GetMatchDetails") do
      test_client.match(sample_match_id).drafts.last
    end
  end

  specify "#pick?" do
    expect(draft.pick?).to eq true
  end

  specify "#order" do
    expect(draft.order).to eq 20
  end

  specify "#hero" do
    expect(draft.hero).to be_a Dota::API::Hero
  end
end

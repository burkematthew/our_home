shared_examples "assignable" do
  it { is_expected.to have_many(:assignees) }
end

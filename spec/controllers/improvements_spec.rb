require 'rails_helper'

describe ImprovementsController, type: :request do
  let(:current_user) { create(:user) }

  describe "#update" do
    let!(:imp){ create(:improvement, name: "original name", user: current_user) }
    let(:params) {{
      "improvement"=>{
        "name"=>"new set name",
        "description"=>"sahewaja4j2aja4jha4jaherhzdfh fdh sd",
        "is_private"=>"1",
        "estimated_effort"=>"1.02",
        "actual_effort"=>"24.0",
        "status"=>"created"
      }
    }}

    subject { patch "/improvements/#{imp.id}", params: params }

    # pretend we have logged in as a user skipping facebook integration
    before(:each) do
      allow_any_instance_of(ImprovementsController).to receive(:current_user).and_return(current_user)
    end

    it "updates a improvement if the user owns the improvement" do

      expect(subject).to redirect_to action: :show, id: imp.id

      expect(imp.reload.name).to eq("new set name")
    end

    it "does not update if the user doesn't own the improvement" do
      imp.user = create(:user)
      imp.save!

      expect(subject).to redirect_to action: :index

      expect(imp.reload.name).to eq("original name")
    end
  end
end

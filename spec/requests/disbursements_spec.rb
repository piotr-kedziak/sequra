require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/disbursements", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Disbursement. As you add validations to Disbursement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Disbursement.create! valid_attributes
      get disbursements_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      disbursement = Disbursement.create! valid_attributes
      get disbursement_url(disbursement)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_disbursement_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      disbursement = Disbursement.create! valid_attributes
      get edit_disbursement_url(disbursement)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Disbursement" do
        expect {
          post disbursements_url, params: { disbursement: valid_attributes }
        }.to change(Disbursement, :count).by(1)
      end

      it "redirects to the created disbursement" do
        post disbursements_url, params: { disbursement: valid_attributes }
        expect(response).to redirect_to(disbursement_url(Disbursement.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Disbursement" do
        expect {
          post disbursements_url, params: { disbursement: invalid_attributes }
        }.to change(Disbursement, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post disbursements_url, params: { disbursement: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested disbursement" do
        disbursement = Disbursement.create! valid_attributes
        patch disbursement_url(disbursement), params: { disbursement: new_attributes }
        disbursement.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the disbursement" do
        disbursement = Disbursement.create! valid_attributes
        patch disbursement_url(disbursement), params: { disbursement: new_attributes }
        disbursement.reload
        expect(response).to redirect_to(disbursement_url(disbursement))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        disbursement = Disbursement.create! valid_attributes
        patch disbursement_url(disbursement), params: { disbursement: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested disbursement" do
      disbursement = Disbursement.create! valid_attributes
      expect {
        delete disbursement_url(disbursement)
      }.to change(Disbursement, :count).by(-1)
    end

    it "redirects to the disbursements list" do
      disbursement = Disbursement.create! valid_attributes
      delete disbursement_url(disbursement)
      expect(response).to redirect_to(disbursements_url)
    end
  end
end

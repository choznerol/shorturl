require 'rails_helper'

RSpec.describe MappingsController, type: :controller do
  let(:valid_attributes) { { target_url: 'https://github.com' } }

  let(:invalid_attributes) { { target_url: '' } }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      mapping = Mapping.create! valid_attributes
      get :show, params: { id: mapping.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Mapping' do
        expect {
          post :create, params: { mapping: valid_attributes }
        }.to change(Mapping, :count).by(1)
      end

      it 'redirects to the created mapping' do
        post :create, params: { mapping: valid_attributes }
        expect(response).to redirect_to(Mapping.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { mapping: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #redirect_to_target' do
    before do
      post :create, params: { mapping: valid_attributes } # Create a Mapping
    end

    context 'with valid params' do
      let(:mapping) { Mapping.last }

      it 'redirects to correct target_url' do
        get :redirect_to_target, params: { key: mapping.key }

        expect(response).to redirect_to 'https://github.com'
      end
    end
  end
end

require 'spec_helper'

describe ShelvesController do

=begin
  # This should return the minimal set of attributes required to create a valid
  # Shelf. As you add validations to Shelf, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShelvesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all shelves as @shelves" do
      shelf = Shelf.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:shelves)).to eq([shelf])
    end
  end

  describe "GET show" do
    it "assigns the requested shelf as @shelf" do
      shelf = Shelf.create! valid_attributes
      get :show, {:id => shelf.to_param}, valid_session
      expect(assigns(:shelf)).to eq(shelf)
    end
  end

  describe "GET new" do
    it "assigns a new shelf as @shelf" do
      get :new, {}, valid_session
      expect(assigns(:shelf)).to be_a_new(Shelf)
    end
  end

  describe "GET edit" do
    it "assigns the requested shelf as @shelf" do
      shelf = Shelf.create! valid_attributes
      get :edit, {:id => shelf.to_param}, valid_session
      expect(assigns(:shelf)).to eq(shelf)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Shelf" do
        expect {
          post :create, {:shelf => valid_attributes}, valid_session
        }.to change(Shelf, :count).by(1)
      end

      it "assigns a newly created shelf as @shelf" do
        post :create, {:shelf => valid_attributes}, valid_session
        expect(assigns(:shelf)).to be_a(Shelf)
        expect(assigns(:shelf)).to be_persisted
      end

      it "redirects to the created shelf" do
        post :create, {:shelf => valid_attributes}, valid_session
        expect(response).to redirect_to(Shelf.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shelf as @shelf" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Shelf).to receive(:save).and_return(false)
        post :create, {:shelf => {  }}, valid_session
        expect(assigns(:shelf)).to be_a_new(Shelf)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Shelf).to receive(:save).and_return(false)
        post :create, {:shelf => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shelf" do
        shelf = Shelf.create! valid_attributes
        # Assuming there are no other shelves in the database, this
        # specifies that the Shelf created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Shelf).to receive(:update).with({ "these" => "params" })
        put :update, {:id => shelf.to_param, :shelf => { "these" => "params" }}, valid_session
      end

      it "assigns the requested shelf as @shelf" do
        shelf = Shelf.create! valid_attributes
        put :update, {:id => shelf.to_param, :shelf => valid_attributes}, valid_session
        expect(assigns(:shelf)).to eq(shelf)
      end

      it "redirects to the shelf" do
        shelf = Shelf.create! valid_attributes
        put :update, {:id => shelf.to_param, :shelf => valid_attributes}, valid_session
        expect(response).to redirect_to(shelf)
      end
    end

    describe "with invalid params" do
      it "assigns the shelf as @shelf" do
        shelf = Shelf.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Shelf).to receive(:save).and_return(false)
        put :update, {:id => shelf.to_param, :shelf => {  }}, valid_session
        expect(assigns(:shelf)).to eq(shelf)
      end

      it "re-renders the 'edit' template" do
        shelf = Shelf.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Shelf).to receive(:save).and_return(false)
        put :update, {:id => shelf.to_param, :shelf => {  }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shelf" do
      shelf = Shelf.create! valid_attributes
      expect {
        delete :destroy, {:id => shelf.to_param}, valid_session
      }.to change(Shelf, :count).by(-1)
    end

    it "redirects to the shelves list" do
      shelf = Shelf.create! valid_attributes
      delete :destroy, {:id => shelf.to_param}, valid_session
      expect(response).to redirect_to(shelves_url)
    end
  end
=end

end
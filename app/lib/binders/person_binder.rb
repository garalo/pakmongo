class PersonBinder < Pakyow::Presenter::Binder

  # Target class to be bounded
  binder_for :person

   def edit_link
    {:href => "/people/edit/#{bindable.id}"}
  end
  
   def destroy_link
    {:href => "/people/destroy/#{bindable.id}"}
  end
  
end
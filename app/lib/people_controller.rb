class PeopleController
  include Pakyow::Helpers
  
   def index

    # person = Person.new(:first_name => "Ludwig", :last_name => "Beethoven")
    # person.save
 
    # puts "Hello, I am #{person.first_name} #{person.last_name}"
    # puts "------------"
    
    # Gets the full collection of stored messages
      people = Person.all
      # * Takes the html elemetn with id = "people"
      view = presenter.view.find('#people') if people
      # * Creates a copy for each message
      # * Fills the *first_name* and *last_name* spans with 
      # each message namesake attribute value
      view.repeat_for(people)
    
  end
  
  def new
    Log.puts 'PeopleController::new'
  end
  
   def create
    Log.puts 'PeopleController::new'
    person = Person.new(request.params['person'])
    if person.save
      app.redirect_to!('people')
    else
      #redirect '/new'
      app.redirect_to!('people/new')
    end
  end
  
  def show
    Log.puts 'PeopleController::show'
  end
  
  def edit
    Log.puts 'PeopleController::edit'
    person = Person.find(request.params[:id])
    view = presenter.view.find('form')
    action = "/people/#{person.id}"
    # Sets the edit message form action attribute
    view.attributes.action = action
    # Binds the message to the edit form.
    # This will fill the edit form fields with the
    # current object data.
    view.bind(person)
  end
  
  def update
    Log.puts 'PeopleController::update'
    person = Person.find(request.params[:id])
    #p person.update(request.params['person']) # I think update is mongoid`s issue
    person.update_attributes!(request.params['person']) 
    app.redirect_to!('/people')
  end
  
  def destroy
    Log.puts 'PeopleController::destroy'
    person = Person.find(request.params[:id])
    person.destroy
    app.redirect_to!('/people')
  end
  
end

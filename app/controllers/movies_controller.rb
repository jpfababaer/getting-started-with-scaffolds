class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all

    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movies/index" })
  end

  #5 The method .at() is not actually a defined method to handle ARR. Instead, in the real world, we need to either use .first() or [0] to take out the first Instance from ARR. Adjust it in the method "show" (and the other methods as well) below. SEARCH /movies/show
  def show
    the_id = params.fetch("id")

    matching_movies = Movie.where({ :id => the_id })

    @the_movie = matching_movies[0]

    render({ :template => "movies/show" })
  end

  #17 What is this code doing? We instantiate a new Instance and define the properties within in using params. Then with validations, if VALID = save + redirect. If NOT valid = redirect ONLY. SEARCH /movies/index
  def create
    @the_movie = Movie.new
    @the_movie.title = params.fetch("query_title")
    @the_movie.description = params.fetch("query_description")
    @the_movie.released = params.fetch("query_released", false)

    if @the_movie.valid?
      @the_movie.save
      redirect_to("/movies", { :notice => "Movie created successfully." })
    else
      #20 Making the the_movie an instance variable so when a user inputs invalid values, we can store those values somewhere so they don't have to repopulate the <input>. Then we redfine the redirect into a render to a new html page WITH those instance variables. with_errors is ultimately replaced with new SEARCH /movies/with_errors. 
      render template: "movies/new"
    end
  end

  def update
    the_id = params.fetch("id")
    the_movie = Movie.where({ :id => the_id })[0]

    the_movie.title = params.fetch("query_title")
    the_movie.description = params.fetch("query_description")
    the_movie.released = params.fetch("query_released", false)

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{the_movie.id}", { :alert => the_movie.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("id")
    the_movie = Movie.where({ :id => the_id })[0]

    the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end

  #12 Reusing forms: we are just connecting the dots here for a new route for movies. SEARCH /movies/new
  def new

    #24 Creating the @the_movie instance variable
    @the_movie = Movie.new
    render({template: "movies/new"})
  end

  #15 Reusing forms: 
  def edit
    @the_movie = Movie.where(id: params.fetch(:id))[0]

    render template: "movies/edit"
  end

end

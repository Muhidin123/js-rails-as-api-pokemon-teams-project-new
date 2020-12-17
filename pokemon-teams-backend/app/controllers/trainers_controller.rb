class TrainersController < ApplicationController
    def index
        trainers = Trainer.all
        render json: trainers, include: :pokemons
        #render :json => @programs, :include => {:insurer => {:only => :name}},
    end
end


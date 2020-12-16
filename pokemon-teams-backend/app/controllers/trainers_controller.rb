class TrainersController < ApplicationController
    def index
        trainers = Trainer.all
        render json: trainers, include: :pokemons
        #render :json => @programs, :include => {:insurer => {:only => :name}},
    end

    def show
        trainer = Trainer.find(params[:id])
        render json: TrainerSerializer.new(trainer)
    end

    def create
        offset = rand(Animal.count)
        animal = Animal.offset(offset).first

        render json: animal
    end
end


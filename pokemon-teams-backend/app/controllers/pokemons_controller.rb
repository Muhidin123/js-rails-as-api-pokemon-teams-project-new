class PokemonsController < ApplicationController
    def index
        pokemons = Pokemon.all

        render json: pokemons
    end


    def create
        trainer = Trainer.find(params[:trainer_id])
        pokemon_count = trainer.pokemons.count
        
        if pokemon_count >= 6
            render json: {error: "You have reached poke limit"}
            return
        end


        nickname = Faker::Name.first_name
        species= Faker::Games::Pokemon.name
        pokemon = Pokemon.new(nickname: nickname, species: species, trainer_id: params[:trainer_id])

        if pokemon.save
            render json: pokemon
        else
            render json: {error: "No Pokemon for you"}
        end
    end

    def destroy 
        pokemon = Pokemon.find(params[:id])

        if pokemon.destroy
            render json: pokemon
        else
            render json: {error: "Could not delete pokemon"}
        end
    end

end
class Public::SightingsController < ApplicationController

  def create
    @pet_post = PetPost.find(params[:pet_post_id])
    sighting = current_customer.sightings.build(pet_post_id: @pet_post.id)
    sighting.save
  end

  def destroy
    @pet_post = PetPost.find(params[:pet_post_id])
    sighting = current_customer.sightings.find_by(pet_post_id: @pet_post.id)
    sighting.destroy
  end
end

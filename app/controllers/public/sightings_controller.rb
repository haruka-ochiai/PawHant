class Public::SightingsController < ApplicationController

  def create
    pet_post = PetPost.find(params[:pet_post_id])
    sighting = current_customer.sightings.new(pet_post_id: pet_post.id)
    sighting.save
    redirect_to request.referer
  end

  def destroy
    pet_post = PetPost.find(params[:pet_post_id])
    sighting = current_customer.sightings.find_by(pet_post_id: pet_post.id)
    sighting.destroy
    redirect_to request.referer
  end
end

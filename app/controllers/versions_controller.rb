# app/controllers/versions_controller.rb
class VersionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post_and_version, only: [:diff, :rollback, :destroy]
   
    def diff
    
    end
   
    def rollback
      post = @version.reify
      post.save
      redirect_to edit_post_path(post)
    end

    def bringback
      version = PostVersion.find(params[:id])
      @post = version.reify
      @post.save
      # Let's remove the version since the post is undeleted
      version.delete
      redirect_to root_path, notice: 'The post was successfully brought back!'
    end
   
    private
   
      def set_post_and_version
        @post = Post.find(params[:post_id])
        @version = @post.versions.find(params[:id])
      end
   
  end
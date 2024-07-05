class CommitsController < ApplicationController
  include GithubApiHelper

  def show
    @commit = fetch_commit(params[:owner], params[:repo], params[:commit_id])
    render json: @commit
  end

  def compare
    @diff = compare_commits(params[:owner], params[:repo], params[:base_commit], params[:head_commit])
    render json: @diff
  end

  def index
    @commits = fetch_commits(params[:owner], params[:repo], params[:branch], params[:since], params[:until], params[:per_page], params[:page])
    render json: @commits
  end
end

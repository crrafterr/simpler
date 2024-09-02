class TestsController < Simpler::Controller
  def index
    @time = Time.now
    render 'tests/list', text: :plain
    status 201
    headers['Content-Type'] = 'text/plain'
  end

  def create; end

  def show
    @id = params[:id]
  end
end

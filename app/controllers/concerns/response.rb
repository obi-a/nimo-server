module Response
  def json_response(object, opts = {})
    options = {json: object, status: :ok, include: ''}.merge(opts)

    render options
  end
end

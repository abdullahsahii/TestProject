class RoleConstraint
  def initialize(role)
    @role = role
  end

  def matches?(request)
    user = request.env['warden'].user
    user.present? && user.role == @role
  end
end
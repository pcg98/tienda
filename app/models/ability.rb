# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(usuario)
    send("#{usuario.rol.rol}_permisos", usuario)
  end
  #Permisos admin
  def admin_permisos(usuario)
    #Admin puede manejar todo
    can :manage, :all
  end
  #Permisos cliente
  def cliente_permisos(usuario)
    #Leer todos los productos
    can :read, Producto, :all
    #Manejar su carrito
    can :manage, Carrito, { usuario_id: usuario.id}
    #Ver info y actualizar de su usuario
    can [:read, :update], Usuario, { id: usuario.id }
  end
  #Visitantes
  def visitante_permisos(usuario)
    #
    can :read, Producto, :all
    can :create, Usuario, :all
  end
  def lista_de_permisos
    def usuario_params
      params.permit(:correo, :password, :rol_id)
    end
      rules.map do |rule|
      object = { acciones: rule.actions, sobre: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:condiciones] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end
  #def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  #end
end

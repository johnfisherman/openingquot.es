# frozen_string_literal: true

# Settings for the Brick gem
# (By default this auto-creates models, controllers, views, and routes on-the-fly.)

if ActiveRecord::Base.respond_to?(:brick_select) && !::Brick.initializer_loaded
  # Mode -- generally :on or :off, or only in :development.  Also available is :diag_env which enables only
  # when the environment variable BRICK is set.
  Brick.mode = :development
  # Can be further overridden by placing this line in development.rb / test.rb / production.rb:
  # # Brick.mode = :on # (or :off to entirely disable)

  # # Custom path prefix to apply to all auto-generated Brick routes.  Also causes auto-generated controllers
  # # to be created inside a module with the same name.
  ::Brick.path_prefix = 'brick'

  # # Normally all are enabled in development mode, and for security reasons only models are enabled in production
  # # and test.  This allows you to either (a) turn off models entirely, or (b) enable controllers, views, and routes
  # # in production.
  # Brick.enable_routes = true # Setting this to "false" will disable routes in development
  # Brick.enable_models = false
  # Brick.enable_controllers = true # Setting this to "false" will disable controllers in development
  # Brick.enable_views = true # Setting this to "false" will disable views in development

  # # If The Brick sees that RSwag gem is present, it allows for API resources to be automatically served out.
  # # You can configure one or more root path(s) for these resources, and when there are multiple then an attempt
  # # is made to return data from that version of the view or table name, or the most recent prior to that version:
  # ::Brick.api_roots = ['/api/v1/']
  # # You may also want to add an OpenAPI 3.0 documentation endpoint using Rswag::Ui:
  # Rswag::Ui.configure do |config|
  #   config.swagger_endpoint '/api-docs/v1/swagger.json', 'API V1 Docs'
  # end

  # # To establish OpenAPI 3.0 documentation endpoints without use of Rswag, such as if you want to use fancier
  # # tooling such as Scalar API or similar, the Brick also allows you to establish endpoints directly:
  # ::Brick.swagger_endpoint '/api-docs/v1/swagger.json', 'API V1 Docs'

  # # By default models are auto-created for database views, and set to be read-only.  This can be skipped.
  # Brick.skip_database_views = true

  # # Any tables or views you'd like to skip when auto-creating models
  # Brick.exclude_tables = ['custom_metadata', 'version_info']

  # # Class that auto-generated models should inherit from
  # Brick.models_inherit_from = ApplicationRecord

  # # Class that auto-generated controllers should inherit from
  # # (Would generally want to un-comment this line if you want to enforce any authentication which is
  # # established in your ApplicationController, or for auto-created controllers to support
  # # Turbo Stream broadcasts.)
  # ::Brick.controllers_inherit_from = 'ApplicationController'

  # # When table names have specific prefixes automatically place them in their own module with a table_name_prefix.
  # Brick.table_name_prefixes = { 'nav_' => 'Navigation' }

  # # COLUMN SEQUENCING AND INCLUSION / EXCLUSION

  # # By default if there is a primary key present then rows in an index view are ordered by this primary key.  To
  # # use a different rule for doing ORDER BY, you can override this default ordering done by The Brick, for instance
  # # to have the rows in a contact list sorted by email:
  # Brick.order = { 'contacts' => { _brick_default: :email } }
  # # or by last name then first name:
  # Brick.order = { 'contacts' => { _brick_default: [:lastname, :firstname] } }
  # # Totally legitimate to have the default order be the name of a belongs_to or has_many association instead of an
  # # actual column name, in which case for has_many it just orders by the count of how many records are associated,
  # # and for belongs_to it's based on the primary table's DSL if any is defined (since that is what is used to
  # # calculate what is shown when a foreign table lists out related records).  If contacts relates to addresses,
  # # then this is perfectly fine:
  # Brick.order = { 'contacts' => { _brick_default: :address } }
  # # You can even have a specific custom clause used in the ORDER BY.  In this case it is recommended to include a
  # # special placeholder for the table name with the sequence "^^^".  Here is an example of having the default
  # # ordering happening on the "code" column, and also defining custom sorting to be done, in this case proper
  # # ordering if that code is stored as a dotted numeric value:
  # Brick.order = { 'document_trees' => { _brick_default: :code,
  #                                       code: "ORDER BY STRING_TO_ARRAY(^^^.code, '.')::int[]" } }

  # # Sequence of columns for each model.  This also allows you to add read-only calculated columns in the same
  # # kind of way that they can be added in the include: portion of include/exclude columns, below.
  # # Designated by { <table name> => [<column name>, <column name>] }
  # Brick.column_sequence = { 'users' => ['email', 'profile.firstname', 'profile.lastname'] }

  # # Specific columns to include or exclude for each model.  If there are only inclusions then only those
  # # columns show.  If there are any exclusions then all non-excluded columns are attempted to be shown,
  # # which negates the usefulness of inclusions except to add calculated column detail built from DSL.
  # # Designated by <table name>.<column name>
  # Brick.column_sequence = { 'users' =>   { include: ['email', 'profile.firstname', 'profile.lastname'] },
  #                           'profile' => { exclude: ['birthdate'] } }

  # # When rendering the grid on index pages, a default number of columns to keep as "sticky" so that they remain
  # # at the left of the grid while scrolling.  By default this is 0 extra columns -- only the link to that
  # # object's show / edit page is sticky.  And this would add one extra column in the mix:
  # Brick.sidescroll = { num_frozen_columns: 1 }
  # # As well if you would like to customise this for specific resources, that is possible:
  # Brick.sidescroll = { num_frozen_columns: 0,
  #                      'products' => { num_frozen_columns: 2 } }

  # # EXTRA FOREIGN KEYS AND OTHER HAS_MANY SETTINGS

  # # Additional table references which are used to create has_many / belongs_to associations inside auto-created
  # # models.  (You can consider these to be "virtual foreign keys" if you wish)...  You only have to add these
  # # in cases where your database for some reason does not have foreign key constraints defined.  Sometimes for
  # # performance reasons or just out of sheer laziness these might be missing.
  # # Each of these virtual foreign keys is defined as an array having three values:
  # #   foreign table name / foreign key column / primary table name.
  # # (We boldly expect that the primary key identified by ActiveRecord on the primary table will be accurate,
  # # usually this is "id" but there are some good smarts that are used in case some other column has been set
  # # to be the primary key.)
  # Brick.additional_references = [['orders', 'customer_id', 'customer'],
  #                                ['customer', 'region_id', 'regions']]

  # # Custom columns to add to a table, minimally defined with a name and DSL string.
  # Brick.custom_columns = { 'users' =>  { messages:    ['[COUNT(messages)] messages', 'messages'] },
  #                          'orders' => { salesperson:  '[salesperson.first] [salesperson.last]',
  #                                        products:    ['[COUNT(order_items.product)] products', 'order_items.product' ] }
  #                        }

  # # Skip creating a has_many association for these (only retain the belongs_to built from this additional_reference).
  # # (Uses the same exact three-part format as would define an additional_reference)
  # # Say for instance that we didn't care to display the favourite colours that users have:
  # Brick.exclude_hms = [['users', 'favourite_colour_id', 'colours']]

  # # Skip showing counts for these specific has_many associations when building auto-generated #index views.
  # # When there are related tables with a significant number of records (generally 100,000 or more), this can lessen
  # # the load on the database considerably, sometimes fixing what might appear to be an index page that just "hangs"
  # # for no apparent reason.
  # Brick.skip_index_hms = ['User.litany_of_woes']

  # # By default primary tables involved in a foreign key relationship will indicate a "has_many" relationship pointing
  # # back to the foreign table.  In order to represent a "has_one" association instead, an override can be provided
  # # using the primary model name and the association name which you instead want to have treated as a "has_one":
  # Brick.has_ones = [['User', 'user_profile']]
  # # If you want to use an alternate name for the "has_one", such as in the case above calling the association "profile"
  # # instead of "user_profile", then apply that as a third parameter like this:
  # Brick.has_ones = [['User', 'user_profile', 'profile']]

  # # Automatically establish #accepts_nested_attributes_for logic on has_many and has_one associations.
  # # This video to demonstrates how this works:  https://github.com/lorint/brick/assets/5301131/82ac4f6d-bc23-4a55-adab-bc754bcb0f26
  # Brick.nested_attributes = { 'User' => ['profile', 'posts'] }

  # # Auto-create specific has_many ___, through: ___ associations
  # Brick.hmts = [['recipes', 'recipe_ingredients', 'ingredients']]

  # # Treat specific tables as being associative, using them to wire up HMT relationships.  (This is normally the
  # # default when a table contains only foreign keys, but when that otherwise associative "JOIN" table has any
  # # other data columns, it is considered a data table and not really associative.  This overrides in order to
  # # have a table to still be treated as associative, causing HMTs to be auto-generated.)
  # Brick.treat_as_associative = ['flights']

  # # Further, if you want to present a given associative table in various ways then you can choose a 2D
  # # constellation map of checkboxes, or bezier curves showing the association between a list at the left and at
  # # the right.  Indicating just :bezier is the same as :bezier_full, which shows the full list of all possible
  # # things that can be associated.  :bezier_union shows just the ones that are currently wired up, and
  # # :bezier_excluded, :bezier_excluded_left, or :bezier_excluded_right shows the ones not yet wired up.
  # Brick.treat_as_associative = { 'flights' => { bezier: ['departure.code', 'arrival.code'] },
  #                                'crew' => { constellation: ['flight', 'personnel', '[used ? [used it!] : []]'] } }

  # # We normally don't show the timestamp columns "created_at", "updated_at", and "deleted_at", and also do
  # # not consider them when finding associative tables to support an N:M association.  (That is, ones that can be a
  # # part of a has_many :through association.)  If you want to use different exclusion columns than our defaults
  # # then this setting resets that list.  For instance, here is an override that is useful in the Sakila sample
  # # database:
  # Brick.metadata_columns = ['last_update']

  # # Columns for which to add a validate presence: true even though the database doesn't have them marked as NOT NULL.
  # # Designated by <table name>.<column name>
  # Brick.not_nullables = ['users.name']

  # # String or text columns which for editing purposes should be treated as JSON.  Format for the hash is:
  # # { table_name => [column names] }
  # Brick.json_columns = { 'users' => ['info'] }

  # # FRIENDLY DSL

  # # A simple DSL is available to allow more user-friendly display of objects.  Normally a user object might be shown
  # # as its first non-metadata column, or if that is not available then something like "User #42" where 42 is that
  # # object's ID.  If there is no primary key then even that is not possible, so the object's .to_s method is called.
  # # To override these defaults and specify exactly what you want shown, such as first names and last names for a
  # # user, then you can use model_descrips like this, putting expressions with property references in square brackets:
  # Brick.model_descrips = { 'User' => '[profile.firstname] [profile.lastname]' }

  # # ERD SETTINGS

  # # By default the Entity Relationship Diagram fragment which is available to be shown on the Grid page includes
  # # primary and foreign keys.  In order for it to show all columns in all cases, set this value to +true+:
  # Brick.config.erd_show_columns = true
  # # or to show all columns for specific tables, supply an array of model names:
  # Brick.config.erd_show_columns = ['User', 'OrderDetail']

  # # SINGLE TABLE INHERITANCE

  # # Specify STI subclasses either directly by name or as a general module prefix that should always relate to a specific
  # # parent STI class.  The prefixed :: here for these examples is mandatory.  Also having a suffixed :: means instead of
  # # a class reference, this is for a general namespace reference.  So in this case requests for, say, either of the
  # # non-existent classes Animals::Cat or Animals::Goat (or anything else with the module prefix of "Animals::" would
  # # build a model that inherits from Animal.  And a request specifically for the class Snake would build a new model
  # # that inherits from Reptile, and no other request would do this -- only specifically for Snake.  The ending ::
  # # indicates that it's a module prefix instead of a specific class name.
  # Brick.sti_namespace_prefixes = { '::Animals::' => 'Animal',
  #                                  '::Snake' => 'Reptile' }

  # # Custom inheritance_column to be used for STI.  This is by default "type", and applies to all models.  With this
  # # option you can change this either for specific models, or apply a new overall name generally:
  # Brick.sti_type_column = 'sti_type'
  # Brick.sti_type_column = { 'rails_type' => ['sales.specialoffer'] }

  # # POLYMORPHIC ASSOCIATIONS

  # # Polymorphic associations are set up by providing a model name and polymorphic association name like this:
  # Brick.polymorphics = {
  #                        'comments.commentable' => nil,
  #                        'images.imageable' => nil
  #                      }

  # # For multi-tenant databases that use a separate schema for each tenant, a single representative database schema
  # # can be analysed to determine the range of polymorphic classes that can be used for each association.  Hopefully
  # # the schema chosen is one loaded with existing data that is representative of all possible polymorphic
  # # associations.
  # Brick.schema_behavior = :namespaced
  # Brick.schema_behavior = { multitenant: { schema_to_analyse: 'engineering' } }

  # # DEFAULT ROOT ROUTE

  # # If a default route is not supplied, Brick attempts to find the most "central" table and wires up the default
  # # route to go to the :index action for what would be a controller for that table.  You can specify any controller
  # # name and action you wish in order to override this and have that be the default route when none other has been
  # # specified in routes.rb or elsewhere.  (Or just use an empty string in order to disable this behaviour.)
  # This defaults to "customers#index", and if there was also a prefix set called "admin" then it would instead
  # go to "admin/customers#index".
  # Brick.default_route_fallback = 'customers'
  # Brick.default_route_fallback = 'orders#outstanding' # Example of a non-RESTful route
  # Brick.default_route_fallback = '' # Omits setting a default route in the absence of any other
end

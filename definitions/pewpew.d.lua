-- Auto-generated type definitions from ppl-docs (https://github.com/pewpewlive/ppl-docs)
---@meta
---@alias fixedpoint number
---@alias entity_id integer

pewpew = {}

---@enum
pewpew.EntityType = {
  ASTEROID = 0,
  BAF = 1,
  INERTIAC = 2,
  MOTHERSHIP = 3,
  MOTHERSHIP_BULLET = 4,
  ROLLING_CUBE = 5,
  ROLLING_SPHERE = 6,
  UFO = 7,
  WARY = 8,
  CROWDER = 9,
  CUSTOMIZABLE_ENTITY = 10,
  SHIP = 11,
  BOMB = 12,
  BAF_BLUE = 13,
  BAF_RED = 14,
  WARY_MISSILE = 15,
  UFO_BULLET = 16,
  SPINY = 17,
  SUPER_MOTHERSHIP = 18,
  PLAYER_BULLET = 19,
  BOMB_EXPLOSION = 20,
  PLAYER_EXPLOSION = 21,
  BONUS = 22,
  FLOATING_MESSAGE = 23,
  POINTONIUM = 24,
  KAMIKAZE = 25,
  BONUS_IMPLOSION = 26,
  MACE = 27,
  PLASMA_FIELD = 28,
}

---@enum
pewpew.MothershipType = {
  THREE_CORNERS = 0,
  FOUR_CORNERS = 1,
  FIVE_CORNERS = 2,
  SIX_CORNERS = 3,
  SEVEN_CORNERS = 4,
}

---@enum
pewpew.CannonType = {
  SINGLE = 0,
  TIC_TOC = 1,
  DOUBLE = 2,
  TRIPLE = 3,
  FOUR_DIRECTIONS = 4,
  DOUBLE_SWIPE = 5,
  HEMISPHERE = 6,
  SHOTGUN = 7,
  LASER = 8,
}

---@enum
pewpew.CannonFrequency = {
  FREQ_30 = 0,
  FREQ_15 = 1,
  FREQ_10 = 2,
  FREQ_7_5 = 3,
  FREQ_6 = 4,
  FREQ_5 = 5,
  FREQ_3 = 6,
  FREQ_2 = 7,
  FREQ_1 = 8,
}

---@enum
pewpew.BombType = {
  FREEZE = 0,
  REPULSIVE = 1,
  ATOMIZE = 2,
  SMALL_ATOMIZE = 3,
  SMALL_FREEZE = 4,
}

---@enum
pewpew.MaceType = {
  DAMAGE_PLAYERS = 0,
  DAMAGE_ENTITIES = 1,
}

---@enum
pewpew.BonusType = {
  REINSTANTIATION = 0,
  SHIELD = 1,
  SPEED = 2,
  WEAPON = 3,
  MACE = 4,
}

---@enum
pewpew.WeaponType = {
  BULLET = 0,
  FREEZE_EXPLOSION = 1,
  REPULSIVE_EXPLOSION = 2,
  ATOMIZE_EXPLOSION = 3,
  PLASMA_FIELD = 4,
  WALL_TRAIL_LASSO = 5,
  MACE = 6,
}

---@enum
pewpew.AsteroidSize = {
  SMALL = 0,
  MEDIUM = 1,
  LARGE = 2,
  VERY_LARGE = 3,
}

--- Prints `str` in the console for debugging.
---@param str string
function pewpew.print(str) end

--- Prints debug info: the number of entities created and the amount of memory used by the script.
function pewpew.print_debug_info() end

--- Sets the level's size. Implicetely adds walls to make sure that entities can not go outside of the level's boundaries. `width` and `height` are clamped to the range ]0fx, 6000fx]. If this function is not called, the level size is (10fx, 10fx), which is uselessly small for most cases.
---@param width fixedpoint
---@param height fixedpoint
function pewpew.set_level_size(width, height) end

--- Adds a wall to the level from (`start_x`,`start_y`) to (`end_x`,`end_y`), and returns its wall ID. A maximum of 200 walls can be added to a level.
---@param start_x fixedpoint
---@param start_y fixedpoint
---@param end_x fixedpoint
---@param end_y fixedpoint
---@return integer
function pewpew.add_wall(start_x, start_y, end_x, end_y) end

--- Remove the wall with the given `wall_id`.
---@param wall_id integer
function pewpew.remove_wall(wall_id) end

--- Adds a callback that will be updated at each game tick.
---@param update_callback function
function pewpew.add_update_callback(update_callback) end

--- Returns the number of players in the game.
---@return integer
function pewpew.get_number_of_players() end

--- Increases the score of the player at the specified `player_index` by an amount of `delta`. `player_index` must in the range [0, get_number_of_players() - 1]. Note that `delta` can be negative.
---@param player_index integer
---@param delta integer
function pewpew.increase_score_of_player(player_index, delta) end

--- Increases the score streak counter of the player at the specified `player_index` by an amount of `delta`. This counter is used to determine at which level of score streak the player is at. In turn, the score streak level is used to determine how much pointonium is given. Typically the score streak counter should be increased when an enemy is destroyed with the same score that the enemy provide. `player_index` must in the range [0, get_number_of_players() - 1]. Note that `delta` can be negative.
---@param player_index integer
---@param delta integer
function pewpew.increase_score_streak_of_player(player_index, delta) end

--- Returns a number between 0 and 3. 0 is the lowest score streak (no pointonium is given), while 3 is the highest (3 pointoniums is usually given)
---@param player_index integer
---@return integer
function pewpew.get_score_streak_level(player_index) end

--- Ends the current game.
function pewpew.stop_game() end

--- Returns the inputs of the player at the specified `index`. The return values are in order: the movement joystick's angle (between 0 and 2pi), the movement joystick's distance (between 0 and 1), the shoot joystick's angle (between 0 and 2pi), and the shoot joystick's distance (between 0 and 1).
---@param player_index integer
---@return fixedpoint
---@return fixedpoint
---@return fixedpoint
---@return fixedpoint
function pewpew.get_player_inputs(player_index) end

--- Returns the score of the player at the specified `player_index`. `player_index` must in the range [0, get_number_of_players() - 1].
---@param player_index integer
---@return any
function pewpew.get_score_of_player(player_index) end

--- Configures the player at the specified `player_index`. `player_index` must in the range [0, get_number_of_players() - 1]. A `camera_distance` less than 0fx makes the camera move away from the ship. `camera_rotation_x_axis` is in radian and rotates along the X axis. To temporarily override the XY position of the camera, set **both** `camera_x_override` and `camera_y_override`; this will make the camera be interpolated from wherever it was, to that new position.
---@param player_index integer
---@param configuration table
function pewpew.configure_player(player_index, configuration) end

--- Configures the player's HUD.`player_index` must in the range [0, get_number_of_players() - 1].
---@param player_index integer
---@param configuration table
function pewpew.configure_player_hud(player_index, configuration) end

--- Returns a map containing the configuration of the player at the specified `player_index`.
---@param player_index integer
---@return table
function pewpew.get_player_configuration(player_index) end

--- Configures the weapon of the ship identified with `ship_id` using `configuration`. `frequency` determines the frequency of the shots. `cannon` determines the type of cannon. `duration` determines the number of game ticks during which the weapon will be available. Once the duration expires, the weapon reverts to its permanent configuration. If `duration` is omitted, the weapon will be permanently set to this configuration. If `frequency` or `cannon` is omitted, the ship is configured to not have any weapon.
---@param ship_id entity_id
---@param configuration table
function pewpew.configure_player_ship_weapon(ship_id, configuration) end

--- Configures a wall trail that kills everything inside when the ship it is attached to creates a loop with it. `wall_length` is clamped to  [100, 4000]. In symbiosis, the length is 2000. If `wall_length` is not specified, the trail is removed.
---@param ship_id entity_id
---@param configuration table
function pewpew.configure_player_ship_wall_trail(ship_id, configuration) end

--- Configures various properties of the player ship identified by`id`
---@param ship_id entity_id
---@param configuration table
function pewpew.configure_player_ship(ship_id, configuration) end

--- Reduces the amount of shield of the player that owns the ship by `damage` points. If the player receives damage while having 0 shields left, the player loses.
---@param ship_id entity_id
---@param damage integer
function pewpew.add_damage_to_player_ship(ship_id, damage) end

--- Adds an arrow to the ship identified with `ship_id` pointing towards the entity identified with `entity_id`, and returns the identifier of the arrow. `color` specifies the arrow's color. The arrow is automatically removed when the target entity is destroyed.
---@param ship_id entity_id
---@param target_id entity_id
---@param color integer
---@return integer
function pewpew.add_arrow_to_player_ship(ship_id, target_id, color) end

--- Removes the arrow identified by `arrow_id` from the ship identified by `ship_id`.
---@param ship_id entity_id
---@param arrow_id integer
function pewpew.remove_arrow_from_player_ship(ship_id, arrow_id) end

--- Makes the player ship transparent for `transparency_duration` game ticks.
---@param ship_id entity_id
---@param transparency_duration integer
function pewpew.make_player_ship_transparent(ship_id, transparency_duration) end

--- Sets and returns the **effective speed** of the specified player ship as a function of the **base speed** of the ship. By default, a player ship moves according to its base speed, which is 10 distance units per tick (in the future, different ships may have different base speeds). Assuming the base speed of the ship is S, the new effective speed will be `(factor*S)+offset`. `duration` is the number of ticks during which the effective speed will be applied. Afterwards, the ship's speed reverts to its base speed. If `duration` is negative, the effective speed never reverts to the base speed.
---@param ship_id entity_id
---@param factor fixedpoint
---@param offset fixedpoint
---@param duration integer
---@return fixedpoint
function pewpew.set_player_ship_speed(ship_id, factor, offset, duration) end

--- Returns the list of the entityIDs of all the entities currently in the level. This includes the various bullets and *all* the custom entities.
---@return any
function pewpew.get_all_entities() end

--- Returns the list of collidable entities (which includes all enemies) that overlap with the given disk.
---@param center_x fixedpoint
---@param center_y fixedpoint
---@param radius fixedpoint
---@return any
function pewpew.get_entities_colliding_with_disk(center_x, center_y, radius) end

--- Returns the number of entities of type `type` that are alive.
---@param type integer
---@return integer
function pewpew.get_entity_count(type) end

--- Returns the type of the given entity.
---@param entity_id entity_id
---@return integer
function pewpew.get_entity_type(entity_id) end

--- Plays the sound described at `sound_path` at the index `index`.
---@param sound_path string
---@param index integer
function pewpew.play_ambient_sound(sound_path, index) end

--- Plays the sound described at `sound_path` at the in-game location of `x`,`y`.
---@param sound_path string
---@param index integer
---@param x fixedpoint
---@param y fixedpoint
function pewpew.play_sound(sound_path, index, x, y) end

--- Creates an explosion of particles at the location `x`,`y`. `color` specifies the color of the explosion. `scale` describes how large the explosion will be. It should be in the range ]0, 10], with 1 being an average explosion. `particle_count` specifies the number of particles that make up the explosion. It must be in the range [1, 100].
---@param x fixedpoint
---@param y fixedpoint
---@param color integer
---@param scale fixedpoint
---@param particle_count integer
function pewpew.create_explosion(x, y, color, scale, particle_count) end

--- Adds a particle at the given position, that moves at the given speed, with the given color and duration. The engine may not spawn all particles if are already a lot of particles alive already spawned (e.g. more than 1000)
---@param x fixedpoint
---@param y fixedpoint
---@param z fixedpoint
---@param dx fixedpoint
---@param dy fixedpoint
---@param dz fixedpoint
---@param color integer
---@param duration integer
function pewpew.add_particle(x, y, z, dx, dy, dz, color, duration) end

--- Creates a new Asteroid at the location `x`,`y` and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@return entity_id
function pewpew.new_asteroid(x, y) end

--- Creates a new Asteroid at the location `x`,`y` with an AsteroidSize given by `size` and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param size integer
---@return entity_id
function pewpew.new_asteroid_with_size(x, y, size) end

--- Creates a new BAF at the location `x`,`y`, and returns its entityId. `angle` specifies the angle at which the BAF will move. `speed` specifies the maximum speed it will reach. `lifetime` indicates the number of game ticks after which the BAF is destroyed the next time it hits a wall. Specify a negative `lifetime` to create a BAF that lives forever.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param speed fixedpoint
---@param lifetime integer
---@return entity_id
function pewpew.new_baf(x, y, angle, speed, lifetime) end

--- Creates a new red BAF at the location `x`,`y`, and returns its entityId. A red BAF has more health points than a regular BAF. `angle` specifies the angle at which the BAF will move. `speed` specifies the maximum speed it will reach. `lifetime` indicates the number of game ticks after which the BAF is destroyed the next time it hits a wall. Specify a negative `lifetime` to create a BAF that lives forever.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param speed fixedpoint
---@param lifetime integer
---@return entity_id
function pewpew.new_baf_red(x, y, angle, speed, lifetime) end

--- Creates a new blue BAF at the location `x`,`y`, and returns its entityId. A blue BAF bounces on walls with a slightly randomized angle. `angle` specifies the angle at which the BAF will move. `speed` specifies the maximum speed it will reach. `lifetime` indicates the number of game ticks after which the BAF is destroyed the next time it hits a wall. Specify a negative `lifetime` to create a BAF that lives forever.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param speed fixedpoint
---@param lifetime integer
---@return entity_id
function pewpew.new_baf_blue(x, y, angle, speed, lifetime) end

--- Creates a new Bomb at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param type integer
---@return entity_id
function pewpew.new_bomb(x, y, type) end

--- Creates a new Bonus at the location `x`,`y` of the type `type`, and returns its entityId. For shield bonuses, the option `number_of_shields` determines how many shields are given out. For weapon bonuses, the options `cannon`, `frequency`, `weapon_duration` have the same meaning as in `pewpew.configure_player_ship_weapon`. For speed bonuses, the options `speed_factor`, `speed_offset`,and `speed_duration` have the same meaning as in `set_player_speed`. `taken_callback` is called when the bonus is taken, and is mandatory for the reinstantiation bonus. The callback receives as arguments the entity id of the bonus, the player id, and the ship's entity id. The default box duration is 400 ticks.
---@param x fixedpoint
---@param y fixedpoint
---@param type integer
---@param config table
---@return entity_id
function pewpew.new_bonus(x, y, type, config) end

--- Creates a new Crowder at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@return entity_id
function pewpew.new_crowder(x, y) end

--- Creates a new floating message at the location `x`,`y`, with `str` as the message. The scale is a number that determines how large the  message will be. `1` is the default scale. `ticks_before_fade` determines how many ticks occur before the message starts to fade out. `is_optional` can be used to tell the game if the message can be hidden depending on the user's UI settings.If not specified, `scale` is 1, `ticks_before_fade` is 30 and `is_optional` is `false`. Returns the floating message's entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param str string
---@param config table
---@return entity_id
function pewpew.new_floating_message(x, y, str, config) end

--- Creates a new customizable entity at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@return entity_id
function pewpew.new_customizable_entity(x, y) end

--- Creates a new Inertiac at the location `x`,`y`, and returns its entityId. The inertiac will accelerate according to `acceleration`. It spawns with a random velocity in a direction specified by `angle`.
---@param x fixedpoint
---@param y fixedpoint
---@param acceleration fixedpoint
---@param angle fixedpoint
---@return entity_id
function pewpew.new_inertiac(x, y, acceleration, angle) end

--- Creates a new Kamikaze at the location `x`,`y` that starts moving in the direction specified by `angle`.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@return entity_id
function pewpew.new_kamikaze(x, y, angle) end

--- Creates a new Mothership at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param type integer
---@param angle fixedpoint
---@return entity_id
function pewpew.new_mothership(x, y, type, angle) end

--- Creates a new mothership bullet.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param speed fixedpoint
---@param color integer
---@param large boolean
---@return entity_id
function pewpew.new_mothership_bullet(x, y, angle, speed, color, large) end

--- Creates a new Pointonium at the location `x`,`y`. Value must be 64, 128, or 256.
---@param x fixedpoint
---@param y fixedpoint
---@param value integer
---@return entity_id
function pewpew.new_pointonium(x, y, value) end

--- Creates a new plasma field between `ship_a` and `ship_b`, and returns its entityId. If `ship_a` or `ship_b` is destroyed, the plasma field is destroyed as well.
---@param ship_a_id entity_id
---@param ship_b_id entity_id
---@param config table
---@return entity_id
function pewpew.new_plasma_field(ship_a_id, ship_b_id, config) end

--- Creates a new Player Ship at the location `x`,`y` for the player identified by `player_index`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param player_index integer
---@return entity_id
function pewpew.new_player_ship(x, y, player_index) end

--- Creates a new bullet at the location `x`,`y` with the angle `angle` belonging to the player at the index `player_index`. Returns the entityId of the bullet.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param player_index integer
---@return entity_id
function pewpew.new_player_bullet(x, y, angle, player_index) end

--- Creates a new Rolling Cube at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@return entity_id
function pewpew.new_rolling_cube(x, y) end

--- Creates a new Rolling Sphere at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param speed fixedpoint
---@return entity_id
function pewpew.new_rolling_sphere(x, y, angle, speed) end

--- Creates a new Spiny at the location `x`,`y` that starts moving in the direction specified by `angle`. `attractivity` specifies how much the Spiny is attracted to the closest player: 1fx is normal attractivity.
---@param x fixedpoint
---@param y fixedpoint
---@param angle fixedpoint
---@param attractivity fixedpoint
---@return entity_id
function pewpew.new_spiny(x, y, angle, attractivity) end

--- Creates a new Super Mothership at the location `x`,`y`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param type integer
---@param angle fixedpoint
---@return entity_id
function pewpew.new_super_mothership(x, y, type, angle) end

--- Creates a new Wary at the location `x`,`y`.
---@param x fixedpoint
---@param y fixedpoint
---@return entity_id
function pewpew.new_wary(x, y) end

--- Creates a new UFO at the location `x`,`y` moving horizontally at the speed of `dx`, and returns its entityId.
---@param x fixedpoint
---@param y fixedpoint
---@param dx fixedpoint
---@return entity_id
function pewpew.new_ufo(x, y, dx) end

--- Sets whether the rolling cube identified with `id` collides with walls. By default it does not.
---@param entity_id entity_id
---@param collide_with_walls boolean
function pewpew.rolling_cube_set_enable_collisions_with_walls(entity_id, collide_with_walls) end

--- Sets whether the ufo identified with `id` collides with walls. By default it does not.
---@param entity_id entity_id
---@param collide_with_walls boolean
function pewpew.ufo_set_enable_collisions_with_walls(entity_id, collide_with_walls) end

--- Returns the position of the entity identified by `id`.
---@param entity_id entity_id
---@return fixedpoint
---@return fixedpoint
function pewpew.entity_get_position(entity_id) end

--- Returns whether the entity identified by `id` is alive or not.
---@param entity_id entity_id
---@return boolean
function pewpew.entity_get_is_alive(entity_id) end

--- Returns whether the entity identified by `id` is in the process of being destroyed. Returns false if the entity does not exist.
---@param entity_id entity_id
---@return boolean
function pewpew.entity_get_is_started_to_be_destroyed(entity_id) end

--- Sets the position of the entity identified by `id` to `x`,`y`
---@param entity_id entity_id
---@param x fixedpoint
---@param y fixedpoint
function pewpew.entity_set_position(entity_id, x, y) end

--- Sets the radius of the entity identified by `id`. To give you a sense of scale, motherships have a radius of 28fx.
---@param entity_id entity_id
---@param radius fixedpoint
function pewpew.entity_set_radius(entity_id, radius) end

--- Sets a callback that will be called at every tick as long as the entity identified by `id` is alive. Remove the callback by passing a nil `callback`. The callbacks gets called with the entity ID.
---@param entity_id entity_id
---@param callback function
function pewpew.entity_set_update_callback(entity_id, callback) end

--- Makes the entity identified by `id` immediately disappear forever.
---@param entity_id entity_id
function pewpew.entity_destroy(entity_id) end

--- Makes the entity identified by `id` react to the weapon described in `weapon_description`. Returns whether the entity reacted to the weapon. The returned value is typically used to decide whether the weapon should continue to exist or not. In the case of an explosion, `x` and `y` should store the origin of the explosion. In the case of a bullet, `x` and `y` should store the vector of the bullet. The player identified by `player_index` will be assigned points. If `player_index` is invalid, no player will be assigned points.
---@param entity_id entity_id
---@param weapon table
---@return boolean
function pewpew.entity_react_to_weapon(entity_id, weapon) end

--- Adds a mace to the entity identified with `entity_id`. If `rotation_speed` exists, the mace will have a natural rotation, otherwise it will move due to inertia.
---@param target_id entity_id
---@param config table
---@return entity_id
function pewpew.entity_add_mace(target_id, config) end

--- Sets whether the position of the mesh wil be interpolated when rendering. In general, this should be set to true if the entity will be moving.
---@param entity_id entity_id
---@param enable boolean
function pewpew.customizable_entity_set_position_interpolation(entity_id, enable) end

--- Sets whether the angle of the mesh wil be interpolated when rendering. Angle interpolation is enabled by default.
---@param entity_id entity_id
---@param enable boolean
function pewpew.customizable_entity_set_angle_interpolation(entity_id, enable) end

--- Sets the mesh of the customizable entity identified by `id` to the mesh described in the file `file_path` at the index `index`. `index` starts at 0. If `file_path` is an empty string, the mesh is removed.
---@param entity_id entity_id
---@param file_path string
---@param index integer
function pewpew.customizable_entity_set_mesh(entity_id, file_path, index) end

--- Similar to `customizable_entity_set_mesh`, but sets two meshes that will be used in alternation. By specifying 2 separate meshes, 60 fps animations can be achieved.
---@param entity_id entity_id
---@param file_path string
---@param index_0 integer
---@param index_1 integer
function pewpew.customizable_entity_set_flipping_meshes(entity_id, file_path, index_0, index_1) end

--- Sets the color multiplier for the mesh of the customizable entity identified by `id`.
---@param entity_id entity_id
---@param color integer
function pewpew.customizable_entity_set_mesh_color(entity_id, color) end

--- Sets the string to be displayed as part of the mesh of the customizable entity identified by `id`.
---@param entity_id entity_id
---@param text string
function pewpew.customizable_entity_set_string(entity_id, text) end

--- Sets the position of the mesh to x,y,z, relative to the center ofthe customizable entity identified by `id`
---@param entity_id entity_id
---@param x fixedpoint
---@param y fixedpoint
---@param z fixedpoint
function pewpew.customizable_entity_set_mesh_xyz(entity_id, x, y, z) end

--- Sets the height of the mesh of the customizable entity identified by `id`. A `z` greater to 0 makes the mesh be closer, while a `z` less than 0 makes the mesh be further away.
---@param entity_id entity_id
---@param z fixedpoint
function pewpew.customizable_entity_set_mesh_z(entity_id, z) end

--- Sets the scale of the mesh of the customizable entity identified by `id`. A `scale` less than 1 makes the mesh appear smaller, while a `scale` greater than 1 makes the mesh appear larger.
---@param entity_id entity_id
---@param scale fixedpoint
function pewpew.customizable_entity_set_mesh_scale(entity_id, scale) end

--- Sets the scale of the mesh of the customizable entity identified by `id` along the x,y,z axis. A `scale` less than 1 makes the mesh appear smaller, while a `scale` greater than 1 makes the mesh appear larger.
---@param entity_id entity_id
---@param x_scale fixedpoint
---@param y_scale fixedpoint
---@param z_scale fixedpoint
function pewpew.customizable_entity_set_mesh_xyz_scale(entity_id, x_scale, y_scale, z_scale) end

--- Sets the rotation angle of the mesh of the customizable entity identified by `id`. The rotation is applied along the axis defined by `x_axis`,`y_axis`,`z_axis`.
---@param entity_id entity_id
---@param angle fixedpoint
---@param x_axis fixedpoint
---@param y_axis fixedpoint
---@param z_axis fixedpoint
function pewpew.customizable_entity_set_mesh_angle(entity_id, angle, x_axis, y_axis, z_axis) end

--- Skips the interpolation of the mesh's attributes (x, y, z, scale_x, scale_y, scale_z, rotation) for one tick. Only applies to the attributes that were set before the call to `customizable_entity_skip_mesh_attributes_interpolation`
---@param entity_id entity_id
function pewpew.customizable_entity_skip_mesh_attributes_interpolation(entity_id) end

--- Configures the way the entity is going to respond to the music.
---@param entity_id entity_id
---@param config table
function pewpew.customizable_entity_configure_music_response(entity_id, config) end

--- Adds a rotation to the mesh of the customizable entity identified by `id`. The rotation is applied along the axis defined by `x_axis`,`y_axis`,`z_axis`.
---@param entity_id entity_id
---@param angle fixedpoint
---@param x_axis fixedpoint
---@param y_axis fixedpoint
---@param z_axis fixedpoint
function pewpew.customizable_entity_add_rotation_to_mesh(entity_id, angle, x_axis, y_axis, z_axis) end

--- Sets the radius defining the visibility of the entity. This allows the game to know when an entity is actually visible, which in turns allows to massively optimize the rendering. Use the smallest value possible. If not set, the rendering radius is an unspecified large number that effectively makes the entity always be rendered, even if not visible.
---@param entity_id entity_id
---@param radius fixedpoint
function pewpew.customizable_entity_set_visibility_radius(entity_id, radius) end

--- `collide_with_walls` configures whether the entity should stop when colliding with walls. If `collision_callback` is not nil, it is called anytime a collision is detected. The callback gets called with the entity id of the entity withthe callback, and with the normal to the wall.
---@param entity_id entity_id
---@param collide_with_walls boolean
---@param collision_callback function
function pewpew.customizable_entity_configure_wall_collision(entity_id, collide_with_walls, collision_callback) end

--- Sets the callback for when the customizable entity identified by `id` collides with a player's ship. The callback gets called with the entity id of the entity with the callback, and the player_index and ship_id that were involved in the collision. Don't forget to set a radius on the customizable entity, otherwise no collisions will be detected.
---@param entity_id entity_id
---@param collision_callback function
function pewpew.customizable_entity_set_player_collision_callback(entity_id, collision_callback) end

--- Sets the callback for when the customizable entity identified by `id` collides with a player's weapon. The callback gets called with the entity_id of the entity on which the callback is set, the player_index of the player that triggered the weapon, and the type of the weapon. The callback *must* return a boolean saying whether the entity reacts to the weapon. In the case of a bullet, this boolean determines whether the bullet should be destroyed.
---@param entity_id entity_id
---@param weapon_collision_callback function
function pewpew.customizable_entity_set_weapon_collision_callback(entity_id, weapon_collision_callback) end

--- Makes the customizable entity identified by `id` spawn for a duration of `spawning_duration` game ticks.
---@param entity_id entity_id
---@param spawning_duration integer
function pewpew.customizable_entity_start_spawning(entity_id, spawning_duration) end

--- Makes the customizable entity identified by `id` explode for a duration of `explosion_duration` game ticks. After the explosion, the entity is destroyed. `explosion_duration` must be less than 255. Any scale applied to the entity is also applied to the explosion.
---@param entity_id entity_id
---@param explosion_duration integer
function pewpew.customizable_entity_start_exploding(entity_id, explosion_duration) end

--- Sets a tag on customizable entities. The tag can be read back with `customizable_entity_get_tag`.
---@param entity_id entity_id
---@param tag integer
function pewpew.customizable_entity_set_tag(entity_id, tag) end

--- Returns the tag that was set, or 0 if no tag was set.
---@param entity_id entity_id
---@return integer
function pewpew.customizable_entity_get_tag(entity_id) end

fmath = {}

--- Returns the maximum value a fixedpoint integer can take.
---@return fixedpoint
function fmath.max_fixedpoint() end

--- Returns a random fixedpoint value in the range [`min`, `max`]. `max` must be greater or equal to `min`.
---@param min fixedpoint
---@param max fixedpoint
---@return fixedpoint
function fmath.random_fixedpoint(min, max) end

--- Returns an integer in the range [`min`, `max`]. `max` must be greater or equal to `min`.
---@param min any
---@param max any
---@return any
function fmath.random_int(min, max) end

--- Returns the square root of `x`. `x` must be greater or equal to 0.
---@param x fixedpoint
---@return fixedpoint
function fmath.sqrt(x) end

--- Returns the fixedpoint value representing the fraction `numerator`/`denominator`. `denominator` must not be equal to zero.
---@param numerator integer
---@param denominator integer
---@return fixedpoint
function fmath.from_fraction(numerator, denominator) end

--- Returns the integral part of the `value`.
---@param value fixedpoint
---@return any
function fmath.to_int(value) end

--- Returns the absolute value.
---@param value fixedpoint
---@return fixedpoint
function fmath.abs_fixedpoint(value) end

--- Returns a fixedpoint value with the integral part of `value`, and no fractional part.
---@param value any
---@return fixedpoint
function fmath.to_fixedpoint(value) end

--- Returns the sinus and cosinus of `angle`. `angle` is in radian.
---@param angle fixedpoint
---@return fixedpoint
---@return fixedpoint
function fmath.sincos(angle) end

--- Returns the principal value of the arc tangent of y/x. Returns a value in the range [0, 2π[.
---@param y fixedpoint
---@param x fixedpoint
---@return fixedpoint
function fmath.atan2(y, x) end

--- Returns τ (aka 2π).
---@return fixedpoint
function fmath.tau() end



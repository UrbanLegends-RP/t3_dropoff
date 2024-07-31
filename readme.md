# t3_dropoff

t3_dropoff is a GTA FiveM QBCore-based script that allows players to drop off specific items at designated locations in exchange for rewards. Each drop-off location can have its own set of required items, reward type (either item or cash), and customizable labels.

## Features

- Configurable drop-off locations with specific item requirements
- Customizable labels for each drop-off location
- Rewards can be either items or cash
- Uses `qb-target` for interaction zones and `qb-menu` for the interaction menu

## Installation

1. **Download and Extract:**
   - Download the latest version of the `t3_dropoff` script.
   - Extract the contents of the zip file to your `resources` directory.

2. **Configuration:**
   - Open the `config.lua` file and configure your drop-off locations, required items, and rewards.
   - Example configuration:
     ```lua
     Config = {}

     Config.DropOffLocations = {
         {
             coords = vector3(132.41, -652.31, 261.85),
             items = {
                 {name = "red_sulfur", qty = 2},
                 {name = "hydrogen", qty = 3}
             },
             rewardType = "item",
             rewardItem = "harbor_coin",
             rewardAmount = 5,
             label = "Drop Off Chemical Supplies"
         },
         {
             coords = vector3(150.0, -1200.0, 28.0),
             items = {
                 {name = "coke_brick", qty = 1},
                 {name = "bulletshells", qty = 5}
             },
             rewardType = "cash",
             rewardAmount = 1000,
             label = "Drop Off Contraband"
         },
         -- Add more locations and items as needed
     }
     ```

3. **Add to Server Configuration:**
   - Add the following line to your server's `server.cfg` file:
     ```
     ensure t3_dropoff
     ```

## Usage

- Players can interact with the specified drop-off locations using the interaction key.
- A menu will appear showing the required items and the option to deliver the cargo.
- If the player has all the required items, they will be removed from their inventory, and they will receive the specified reward.

## Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Feel free to submit issues and pull requests for improvements and bug fixes.

## Credits

- Developed by T3

## Support

For support, please create an issue on the [GitHub repository](https://github.com/your-repo/t3_dropoff).


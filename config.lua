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

player.onChat("build", function () {
    player.teleport(pos(0, 0, -5))


    //foundations
    blocks.fill(
        DIRT,
        pos(-20, 0, 1),
        pos(50, 4, 70),
        FillOperation.Replace
    )


    //main structure
    blocks.fill(
        POLISHED_ANDESITE,
        pos(10, 5, 20),
        pos(40, 7, 45),
        FillOperation.Replace
    )
    blocks.fill(
        COBBLESTONE,
        pos(10, 7, 20),
        pos(40, 17, 45),
        FillOperation.Hollow
    )
    blocks.fill(
        POLISHED_GRANITE,
        pos(10, 11, 20),
        pos(40, 12, 45),
        FillOperation.Hollow
    )

    //entrance
    blocks.fill(
        AIR,
        pos(11, 11, 21),
        pos(39, 12, 44),
        FillOperation.Hollow
    )
    blocks.fill(
        AIR,
        pos(23, 7, 20),
        pos(27, 12, 20),
        FillOperation.Replace
    )

    //second floor
    blocks.fill(
        PLANKS_JUNGLE,
        pos(11, 12, 21),
        pos(39, 12, 44),
        FillOperation.Hollow
    )

    //towers
    blocks.fill(
        POLISHED_ANDESITE,
        pos(7, 5, 17),
        pos(13, 27, 23),
        FillOperation.Replace
    )
    blocks.fill(
        BLACK_TERRACOTTA,
        pos(7, 28, 17),
        pos(13, 30, 23),
        FillOperation.Replace
    )
    blocks.fill(
        POLISHED_ANDESITE,
        pos(37, 5, 17),
        pos(43, 27, 23),
        FillOperation.Replace
    )
    blocks.fill(
        BLACK_TERRACOTTA,
        pos(37, 28, 17),
        pos(43, 30, 23),
        FillOperation.Replace
    )

    //moat
    blocks.fill(
        AIR,
        pos(5, 1, 15),
        pos(45, 4, 50),
        FillOperation.Replace
    )
    blocks.fill(
        WATER,
        pos(5, 1, 15),
        pos(45, 4, 50),
        FillOperation.Replace
    )

    //bridge
    blocks.fill(
        PLANKS_OAK,
        pos(23, 6, 20),
        pos(27, 6, 16),
        FillOperation.Replace
    )
    blocks.fill(
        PLANKS_OAK,
        pos(23, 5, 16),
        pos(27, 5, 15),
        FillOperation.Replace
    )

    //additional blocks
    blocks.fill(
        POLISHED_DIORITE,
        pos(10, 16, 20),
        pos(40, 17, 45),
        FillOperation.Hollow
    )

    //roof
    for (let i = 0; i <= 9; i++) {
        blocks.fill(
            BRICKS,
            pos(dach1_x2 + i, dach1_y + i, dach1_z + i),
            pos(dach1_x - i, dach1_y + i, dach1_z2 - i),
            FillOperation.Hollow
        )
    }

    //windows
    blocks.fill(
        GLASS,
        pos(20, 9, 20),
        pos(21, 15, 20),
        FillOperation.Replace
    )
    blocks.fill(
        GLASS,
        pos(29, 9, 20),
        pos(30, 15, 20),
        FillOperation.Replace
    )
    blocks.fill(
        GLASS,
        pos(20, 9, 45),
        pos(21, 15, 45),
        FillOperation.Replace
    )
    blocks.fill(
        GLASS,
        pos(29, 9, 45),
        pos(30, 15, 45),
        FillOperation.Replace
    )

    //second floor entrance
    blocks.fill(
        AIR,
        pos(25, 13, 45),
        pos(25, 14, 45),
        FillOperation.Replace
    )
    blocks.fill(
        LADDER,
        pos(25, 5, 46),
        pos(25, 12, 46),
        FillOperation.Replace
    )
})

//variables
//minecraft forced me to do variables like this
let dach1_z2 = 0
let dach1_x = 0
let dach1_z = 0
let dach1_y = 0
let dach1_x2 = 0
let y_stairs = 0
dach1_x2 = 11
dach1_y = 18
dach1_z = 19
dach1_x = 39
dach1_z2 = 46

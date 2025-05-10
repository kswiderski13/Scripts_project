const configuration = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    physics: {
        default: 'arcade',
        arcade: {
            gravity: { y: 300 }, //force of gravity
            debug: true // debugging collisions
        }
    },
    scene: {
        preload,
        create,
        update
    }
}

let game = new Phaser.Game(configuration);
let player;
let controls;
let platforms;
let points;
let score = 0;
let scorecount;

function preload() {
    // assets
    this.load.image('bg', 'lodz.jpg');
    this.load.spritesheet('dude', 'https://labs.phaser.io/assets/sprites/dude.png', {

        frameWidth: 32,
        frameHeight: 48
    });

    this.load.image('ground', 'simple_mario.png')

    this.load.image('point', 'star.png');

}

function create() {
    //world
    //platforms

    this.add.image(400, 300, 'bg')

    platforms = this.physics.add.staticGroup();

    platforms.create(350, 568, 'ground') //.setScale(2).refreshBody();
    platforms.create(600, 450, 'ground');
    platforms.create(50, 250, 'ground');
    platforms.create(750, 220, 'ground');

    platforms.create(450, 500, 'ground');

    platforms.create(40, 550, 'ground');
    platforms.create(100, 550, 'ground');
    platforms.create(120, 650, 'ground');

    //player
    player = this.physics.add.sprite(100, 450, 'dude')

    player.setBounce(0.1);
    player.setCollideWorldBounds(false);

    this.physics.add.collider(player, platforms);


    //points
    points = this.physics.add.group({
        key: 'point',
        repeat: 11,
        setXY: { x: 12, y: 0, stepX: 70 }
    });

    points.children.iterate(function (child) {
        child.setBounceY(Phaser.Math.FloatBetween(0.4, 0.5));
    });

    this.physics.add.collider(points, platforms);
    this.physics.add.overlap(player, points, collectStar, null, this);


    scoreText = this.add.text(16, 16, 'Score: 0', {
        fontSize: '32px',
        fill: '#ffffff'
    });

    //animations
    this.anims.create({
        key: 'left',
        frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
        frameRate: 10,
        repeat: -1
    });

    this.anims.create({
        key: 'turn',
        frames: [{ key: 'dude', frame: 4 }],
        frameRate: 20
    });

    this.anims.create({
        key: 'right',
        frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
        frameRate: 10,
        repeat: -1
    });

    controls = this.input.keyboard.createCursorKeys();
}

function update() {
    //updating frames, input

    if (controls.left.isDown) {
        player.setVelocityX(-160);
        player.anims.play('left', true);
    } else if (controls.right.isDown) {
        player.setVelocityX(160);
        player.anims.play('right', true);
    } else {
        player.setVelocityX(0);
        player.anims.play('turn');
    }

    if (controls.up.isDown && player.body.touching.down) {
        player.setVelocityY(-200);
    }

    if (player.y >= 600) {
        console.log("restart");
        this.scene.restart();
    }
}

//collecting points
function collectStar(player, points) {
    points.disableBody(true, true);
    score += 1;
    scoreText.setText('Score: ' + score);
}


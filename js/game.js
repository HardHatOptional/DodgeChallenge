// Game variables
let canvas, ctx;
let player, enemies = [];
let score = 0;
let gameRunning = false;
let animationId;

// Initialize game elements
function init() {
    canvas = document.getElementById('gameCanvas');
    ctx = canvas.getContext('2d');
    
    // Create player object
    player = {
        x: canvas.width / 2 - 25,
        y: canvas.height - 50,
        width: 50,
        height: 30,
        color: '#3498db',
        speed: 8,
        dx: 0
    };
    
    // Add event listeners for controls
    document.addEventListener('keydown', keyDown);
    document.addEventListener('keyup', keyUp);
    
    // Set up button
    document.getElementById('startButton').addEventListener('click', startGame);
}

// Start the game
function startGame() {
    if (gameRunning) return;
    
    // Reset game state
    gameRunning = true;
    score = 0;
    document.getElementById('scoreValue').textContent = score;
    enemies = [];
    
    // Start the game loop
    animate();
    
    // Start spawning enemies
    spawnEnemies();
}

// Create enemies
function spawnEnemies() {
    if (!gameRunning) return;
    
    const enemy = {
        x: Math.random() * (canvas.width - 30),
        y: -30,
        width: 30,
        height: 30,
        color: '#e74c3c',
        speed: 2 + Math.random() * 3
    };
    
    enemies.push(enemy);
    
    // Adjust difficulty based on score
    const spawnTime = Math.max(500, 2000 - score * 10);
    setTimeout(spawnEnemies, spawnTime);
}

// Game animation loop
function animate() {
    animationId = requestAnimationFrame(animate);
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    // Update player position
    player.x += player.dx;
    
    // Keep player within canvas
    if (player.x < 0) player.x = 0;
    if (player.x + player.width > canvas.width) player.x = canvas.width - player.width;
    
    // Draw player
    ctx.fillStyle = player.color;
    ctx.fillRect(player.x, player.y, player.width, player.height);
    
    // Update and draw enemies
    enemies.forEach((enemy, index) => {
        enemy.y += enemy.speed;
        
        // Remove enemies that go off screen
        if (enemy.y > canvas.height) {
            enemies.splice(index, 1);
            score += 1;
            document.getElementById('scoreValue').textContent = score;
        }
        
        // Check for collision with player
        if (
            enemy.x < player.x + player.width &&
            enemy.x + enemy.width > player.x &&
            enemy.y < player.y + player.height &&
            enemy.y + enemy.height > player.y
        ) {
            gameOver();
        }
        
        // Draw enemy
        ctx.fillStyle = enemy.color;
        ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);
    });
}

// Handle game over
function gameOver() {
    gameRunning = false;
    cancelAnimationFrame(animationId);
    alert(`Game Over! Your score: ${score}`);
}

// Handle keyboard input
function keyDown(e) {
    if (!gameRunning) return;
    
    if (e.key === 'ArrowLeft' || e.key === 'a') {
        player.dx = -player.speed;
    } else if (e.key === 'ArrowRight' || e.key === 'd') {
        player.dx = player.speed;
    }
}

function keyUp(e) {
    if (
        e.key === 'ArrowLeft' || 
        e.key === 'ArrowRight' ||
        e.key === 'a' || 
        e.key === 'd'
    ) {
        player.dx = 0;
    }
}

// Initialize when the page loads
window.addEventListener('load', init);
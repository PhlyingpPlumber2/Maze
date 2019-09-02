var nodes = [];
var strengths = [];
var res = 100;
for(var i = 0; i < res * res; i++){
    nodes[i] = -1;
    strengths[i] = 1;
}
nodes[res * res / 2 + res / 2] = -2;

size(600, 600, P2D);
var f = width / res;
frameRate(30);
var draw = function() {
    background(255);
    strokeCap(SQUARE);
    for(var i = 0; i < res * res; i++){
        var x = i % res;
        var y = floor(i / res);
        if(x > 0 && nodes[x - 1 + y * res] !== -1 && random(1) > 0.95 && nodes[i] === -1){
            nodes[i] = 0;
        }
        if(y > 0 && nodes[x + (y - 1) * res] !== -1 && random(1) > 0.95 && nodes[i] === -1){
            nodes[i] = 2;
        }
        if(x < res - 1 && nodes[x + 1 + y * res] !== -1 && random(1) > 0.95 && nodes[i] === -1){
            nodes[i] = 1;
        }
        if(y < res - 1 && nodes[x + (y + 1) * res] !== -1 && random(1) > 0.95 && nodes[i] === -1){
            nodes[i] = 3;
        }
        strokeWeight(sqrt(strengths[i]));
        if(nodes[i] === 0){
          line((i % res) * f + f / 2, floor(i / res) * f + f / 2, (i % res - 1) * f + f / 2, floor(i / res) * f + f / 2);  
        }
        if(nodes[i] === 1){
          line((i % res) * f + f / 2, floor(i / res) * f + f / 2, (i % res + 1) * f + f / 2, floor(i / res) * f + f / 2);  
        }
        if(nodes[i] === 2){
          line((i % res) * f + f / 2, floor(i / res) * f + f / 2, (i % res) * f + f / 2, floor(i / res - 1) * f + f / 2);  
        }
        if(nodes[i] === 3){
          line((i % res) * f + f / 2, floor(i / res) * f + f / 2, (i % res) * f + f / 2, floor(i / res + 1) * f + f / 2);  
        }
    }
    
    for(var i = 0; i < res * res; i++){
        var x = i % res;
        var y = floor(i / res);
        strengths[i] = 1;
        if(x > 0){
            if(nodes[x - 1 + y * res] === 1){
                strengths[i] += strengths[x - 1 + y * res];
            }
        }
        if(y > 0){
            if(nodes[x - res + y * res] === 3){
                strengths[i] += strengths[x - res + y * res];
            }
        }
        if(x < res - 1){
            if(nodes[x + 1 + y * res] === 0){
                strengths[i] += strengths[x + 1 + y * res];
            }
        }
        if(y < res - 1){
            if(nodes[x + res + y * res] === 2){
                strengths[i] += strengths[x + res + y * res];
            }
        }
    }
};
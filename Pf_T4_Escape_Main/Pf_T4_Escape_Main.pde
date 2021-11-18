//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.003                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

SceneManager scene_manager = new SceneManager();
InventoryManager inventory = new InventoryManager();

boolean debug = true;

void setup(){
    //size(1920, 1080);
    fullScreen();
    frameRate(60);

    //create scenes here



}

void draw(){
    scene_manager.GetCurrentScene().Update();
    inventory.DrawInventory();
}

void mouseMoved() {
}

void mousePressed() {
    if (!inventory.IsInventoryClick()){
        scene_manager.GetCurrentScene().Clicked();
    }
}

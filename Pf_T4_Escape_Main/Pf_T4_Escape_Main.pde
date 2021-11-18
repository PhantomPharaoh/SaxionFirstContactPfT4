//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.002                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

SceneManager scene_manager = new SceneManager();
InventoryManager inventory = new InventoryManager();

boolean debug = true;

void setup(){
    size(1920, 1080);
    fullScreen();
    frameRate(60);

    Scene s = new Scene("test_scene");
    GameObject bg = new GameObject("bg", width/2, height/2, 0, 0);
    bg.SetTexture("Assets/walls1.png");
    s.AddObject(bg);
    Collectable c = new Collectable("ar", 200, 200, 100, 100);
    c.SetTexture("Assets/arrow_left.png");
    s.AddObject(c);
    scene_manager.AddScene(s);

}

void draw(){
    scene_manager.GetCurrentScene().Update();
}

void mouseMoved() {
}

void mousePressed() {
    scene_manager.GetCurrentScene().Clicked();
}

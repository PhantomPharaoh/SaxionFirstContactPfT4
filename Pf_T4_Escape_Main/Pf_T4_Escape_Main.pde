//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.01                  *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

SceneManager scene_manager = new SceneManager();

boolean debug = true;

void setup(){
    //size(1920, 1080);
    fullScreen();
    frameRate(60);

    Scene wall_1 = new Scene("wall_1");
    GameObject w1bg = new GameObject(width/2, height/2, 0, 0);
    w1bg.SetTexture("Assets/walls1.png");
    wall_1.objects.add(w1bg);
    SceneChanger w1la = new SceneChanger("wall_4", 100, height/2, 50, 50);
    w1la.SetTexture("Assets/arrow_left.png", 50, 50);
    wall_1.objects.add(w1la);
    SceneChanger w1ra = new SceneChanger("wall_2", 1820, height/2, 50, 50);
    w1ra.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_1.objects.add(w1ra);
    scene_manager.AddScene(wall_1);

    Scene wall_2 = new Scene("wall_2");
    GameObject w2bg = new GameObject(width/2, height/2, 0, 0);
    w2bg.SetTexture("Assets/walls2.png");
    wall_2.objects.add(w2bg);
    SceneChanger w2la = new SceneChanger("wall_1", 100, height/2, 50, 50);
    w2la.SetTexture("Assets/arrow_left.png", 50, 50);
    wall_2.objects.add(w2la);
    SceneChanger w2ra = new SceneChanger("wall_3", 1820, height/2, 50, 50);
    w2ra.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_2.objects.add(w2ra);
    scene_manager.AddScene(wall_2);

    Scene wall_3 = new Scene("wall_3");
    GameObject w3bg = new GameObject(width/2, height/2, 0, 0);
    w3bg.SetTexture("Assets/walls3.png");
    wall_3.objects.add(w3bg);
    SceneChanger w3la = new SceneChanger("wall_2", 100, height/2, 50, 50);
    w3la.SetTexture("Assets/arrow_left.png", 50, 50);
    wall_3.objects.add(w3la);
    SceneChanger w3ra = new SceneChanger("wall_4", 1820, height/2, 50, 50);
    w3ra.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_3.objects.add(w3ra);
    scene_manager.AddScene(wall_3);

    Scene wall_4 = new Scene("wall_4");
    GameObject w4bg = new GameObject(width/2, height/2, 0, 0);
    w4bg.SetTexture("Assets/walls4.png");
    wall_4.objects.add(w4bg);
    SceneChanger w4la = new SceneChanger("wall_3", 100, height/2, 50, 50);
    w4la.SetTexture("Assets/arrow_left.png", 50, 50);
    wall_4.objects.add(w4la);
    SceneChanger w4ra = new SceneChanger("wall_1", 1820, height/2, 50, 50);
    w4ra.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_4.objects.add(w4ra);
    scene_manager.AddScene(wall_4);

}

void draw(){
    scene_manager.GetCurrentScene().Update();
}

void mouseMoved() {
}

void mousePressed() {
    scene_manager.GetCurrentScene().Clicked();
}

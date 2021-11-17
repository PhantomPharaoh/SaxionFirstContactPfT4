//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.01                  *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

SceneManager scene_manager = new SceneManager();

void setup(){
    size(800, 600);
    frameRate(60);


    Scene wall_1 = new Scene("wall_1");
    GameObject wall_1_sprite = new GameObject(width/2, height/2, "Assets/wall_1.png");
    wall_1.objects.add(wall_1_sprite);
    SceneChanger wall_1_arrow_l = new SceneChanger("wall_4", 100, 300, "Assets/arrow_left.png");
    wall_1.objects.add(wall_1_arrow_l);
    SceneChanger wall_1_arrow_r = new SceneChanger("wall_2", 700, 300, "Assets/arrow_right.png");
    wall_1.objects.add(wall_1_arrow_r);
    scene_manager.AddScene(wall_1);

    Scene wall_2 = new Scene("wall_2");
    GameObject wall_2_sprite = new GameObject(width/2, height/2, "Assets/wall_2.png");
    wall_2.objects.add(wall_2_sprite);
    SceneChanger wall_2_arrow_l = new SceneChanger("wall_1", 100, 300, "Assets/arrow_left.png");
    wall_2.objects.add(wall_2_arrow_l);
    SceneChanger wall_2_arrow_r = new SceneChanger("wall_3", 700, 300, "Assets/arrow_right.png");
    wall_2.objects.add(wall_2_arrow_r);
    scene_manager.AddScene(wall_2);
    
    Scene wall_3 = new Scene("wall_3");
    GameObject wall_3_sprite = new GameObject(width/2, height/2, "Assets/wall_3.png");
    wall_3.objects.add(wall_3_sprite);
    SceneChanger wall_3_arrow_l = new SceneChanger("wall_2", 100, 300, "Assets/arrow_left.png");
    wall_3.objects.add(wall_3_arrow_l);
    SceneChanger wall_3_arrow_r = new SceneChanger("wall_4", 700, 300, "Assets/arrow_right.png");
    wall_3.objects.add(wall_3_arrow_r);
    scene_manager.AddScene(wall_3);

    Scene wall_4 = new Scene("wall_4");
    GameObject wall_4_sprite = new GameObject(width/2, height/2, "Assets/wall_4.png");
    wall_4.objects.add(wall_4_sprite);
    SceneChanger wall_4_arrow_l = new SceneChanger("wall_3", 100, 300, "Assets/arrow_left.png");
    wall_4.objects.add(wall_4_arrow_l);
    SceneChanger wall_4_arrow_r = new SceneChanger("wall_1", 700, 300, "Assets/arrow_right.png");
    wall_4.objects.add(wall_4_arrow_r);
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

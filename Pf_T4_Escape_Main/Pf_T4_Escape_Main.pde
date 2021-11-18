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
    
    //Scene_1
    Scene wall_1 = new Scene("wall_1");                                                                                 //making a new class Scene for the whole scene, in other words this is Scene_1
    GameObject wall_1_bg = new GameObject("wall_1_bg", width/2, height/2, 0, 0);                                        //making a new class GameObject for background, GameObject(class_name, position_X_Object, position_Y_Object, clicking_Area_X_Object, clicking_Area_Y_Object), int his case, you wnat the background starting X, Y on the middle of the screen
    wall_1_bg.SetTexture("Assets/walls1.png");                                                                          //add the texture, which is the image file
    wall_1.AddObject(wall_1_bg);                                                                                        //add this GameObject class to the Scene class
    SceneChanger wall_1_rightArrow = new SceneChanger("wall_2", "wall_1_rightArrow", width - 100, height/2, 50, 50);    //this is a sub-class of objects that are used to change scenes -> SceneChanger(destination, name of class SceneChanger, starting X, starting Y, clicking Area X, clicking Area Y)
    wall_1_rightArrow.SetTexture("Assets/arrowright.png", 50, 50);                                                      //add image texture AND clicking area X & Y of the SceneChanger
    wall_1_rightArrow.SetItemCondition("key");                                                                          //define the condition to trigger the SceneChanger, If the condition is not fufilled than the codes of SceneChanger won't be executed
    wall_1.AddObject(wall_1_rightArrow);                                                                                //add this SceneChanger class to its parent class -> GameObject class -> then to Scene class
    Collectable keyz = new Collectable("key", 200, 200, 50, 50);                                                        //this is a sub-class of objects that becomes a requirement to trigger class SceneChanger -> Collectable (class_name, starting X, starting Y, clicking Area X, clicking Area Y)
    keyz.SetTexture("Assets/key_image.png", 50, 50);                                                                    //add image texture to keyz, and clicking area
    wall_1.AddObject(keyz);                                                                                             //add this Collectable class -> GameObject(parent class) -> Scene
    scene_manager.AddScene(wall_1);                                                                                     //add the created Scene class to the main sketch 

    //Scene_2
    Scene wall_2 = new Scene("wall_2");
    GameObject wall_2_bg = new GameObject("wall_2_bg", width/2, height/2, 0, 0);
    wall_2_bg.SetTexture("Assets/walls2.png");
    wall_2.AddObject(wall_2_bg);
    SceneChanger wall_2_leftArrow = new SceneChanger("wall_1", "wall_2_leftArrow", 100, height/2, 50, 50);                  //destination: Scene_1-- going BACKWARD
    wall_2_leftArrow.SetTexture("Assets/arrowleft.png", 50, 50);
    wall_2.AddObject(wall_2_leftArrow);
    SceneChanger wall_2_rightArrow = new SceneChanger("wall_3", "wall_2_rightArrow", width - 100, height/2, 50, 50);          //destination: Scene_3 -- going FORWARD
    wall_2_rightArrow.SetTexture("Assets/arrowright.png", 50, 50);
    wall_2.AddObject(wall_2_rightArrow);
    scene_manager.AddScene(wall_2);
    
    //Scene_3
    Scene wall_3 = new Scene("wall_3");
    GameObject wall_3_bg = new GameObject("wall_3_bg", width/2, height/2, 0, 0);
    wall_3_bg.SetTexture("Assets/walls3.png");
    wall_3.AddObject(wall_3_bg);
    SceneChanger wall_3_leftArrow = new SceneChanger("wall_2", "wall_3_leftArrow", 100, height/2, 50, 50);                  //destination: Scene_2-- going BACKWARD
    wall_3_leftArrow.SetTexture("Assets/arrowleft.png", 50, 50);
    wall_3.AddObject(wall_3_leftArrow);
    SceneChanger wall_3_downArrow = new SceneChanger("wall_4", "wall_3_downArrow", width/2, height-200, 50, 50);          //destination: Scene_4 -- going FORWARD
    wall_3_downArrow.SetTexture("Assets/arrowdown.png", 50, 50);
    wall_3.AddObject(wall_3_downArrow);
    scene_manager.AddScene(wall_3);
    
    //Scene_4
    Scene wall_4 = new Scene("wall_4");
    GameObject wall_4_bg = new GameObject("wall_4_bg", width/2, height/2, 0, 0);
    wall_4_bg.SetTexture("Assets/walls4.png");
    wall_4.AddObject(wall_4_bg);
    SceneChanger wall_4_upArrow = new SceneChanger("wall_3", "wall_4_upArrow", width/2, 200, 50, 50);                  //destination: Scene_3 -- going BACKWARD
    wall_4_upArrow.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_4_upArrow.SetItemCondition("word_A");
    wall_4.AddObject(wall_4_upArrow);
    Collectable word_A = new Collectable("word_A", 200, 200, 50, 50);                                                  //Requirement_for_BACKWARD: word_A
    word_A.SetTexture("Assets/word_A.png", 50, 50);
    wall_4.AddObject(word_A);
    SceneChanger wall_4_downArrow = new SceneChanger("wall_5", "wall_4_downArrow", width/2, height-200, 50, 50);          //destination: Scene_5_escape -- going FORWARD
    wall_4_downArrow.SetTexture("Assets/arrowdown.png", 50, 50);
    wall_4.AddObject(wall_4_downArrow);
    scene_manager.AddScene(wall_4);
    
    //Scene_5_escape
    Scene wall_5 = new Scene("wall_5");
    GameObject wall_5_bg = new GameObject("wall_5_bg", width/2, height/2, 0, 0);
    wall_5_bg.SetTexture("Assets/wall_2.png");
    wall_5.AddObject(wall_5_bg);
    SceneChanger wall_5_upArrow = new SceneChanger("wall_4", "wall_4_upArrow", width/2, 500, 50, 50);                  //destination: Scene_3-- going BACKWARD
    wall_5_upArrow.SetTexture("Assets/arrow_right.png", 50, 50);
    wall_5.AddObject(wall_5_upArrow);
    scene_manager.AddScene(wall_5);
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

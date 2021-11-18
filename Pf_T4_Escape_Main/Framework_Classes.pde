//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.002                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

class Scene{
    public String name;
    public ArrayList<GameObject> objects = new ArrayList<GameObject>();
    private ArrayList<String> marked_to_remove = new ArrayList<String>();

    public Scene(String name){
        this.name = name;
    }

    public void Update(){
        if (marked_to_remove.size() > 0){
            for (String i : marked_to_remove) {
                RemoveObject(i);
            }
            marked_to_remove.clear();
        }

        for (GameObject i : objects) {
            i.Update();
        }
    }

    public void Clicked(){
        for (GameObject i : objects) {
            if (mouseX >= i.position.x - i.size.x/2 && mouseX <= i.position.x + i.size.x/2){
                if (mouseY >= i.position.y - i.size.y/2 && mouseY <= i.position.y + i.size.y/2){
                    if (i.item_needed == ""){
                        i.Clicked();
                    }
                    else if (inventory.GetSelectedItem() != ""){
                        if (i.item_needed == inventory.GetSelectedItem()) {
                            i.Clicked();
                            inventory.RemoveSelectedItem();
                        }
                    }
                }
            }
        }
    }

    public void AddObject(GameObject to_add){
        objects.add(to_add);
    }

    private void RemoveObject(String to_remove){
        int remove_index = 0;
        for (int i = 0; i < objects.size(); ++i) {
            if (objects.get(i).name == to_remove) {
                remove_index = i;
                break;
            }
        }
        objects.remove(remove_index);
    }

    public void MarkForRemoval(String object_name){
        marked_to_remove.add(object_name);
    }

}

class GameObject{
    public String name;
    public PVector position = new PVector(0,0);
    public PVector size = new PVector(0,0);
    public PImage texture;
    private PVector texture_size = new PVector(0,0);
    public String item_needed = "";

    public void Update(){

        if (texture != null){
            imageMode(CENTER);
            if (texture_size.y == 0 || texture_size.y == 0){
                image(texture, position.x, position.y);
            }
            else{
                image(texture, position.x, position.y, texture_size.x, texture_size.y);
            }
        }
        
        if (debug){
            fill(0, 0, 255, 50);
            noStroke();
            rect(position.x - size.x/2, position.y - size.y/2, size.x, size.y);
        }

    }

    public void Clicked(){
    }

    public GameObject(String name, int pos_x, int pos_y, int size_x, int size_y){
        this.name = name;
        position.x = pos_x;
        position.y = pos_y;
        size.x = size_x;
        size.y = size_y;
    }

    public void SetTexture(String image_path){
        texture = loadImage(image_path);
    }
    public void SetTexture(String image_path, int size_x, int size_y){
        texture = loadImage(image_path);
        texture_size.x = size_x;
        texture_size.y = size_y;
    }

    public void SetItemCondition(String item_name){
        item_needed = item_name;
    }

}

class SceneChanger extends GameObject{
    public String target_scene;

    public SceneChanger(String target_scene, String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        this.target_scene = target_scene;
    }

    @Override
    public void Clicked(){
        scene_manager.ChangeScene(target_scene);
    }

}

class Collectable extends GameObject{
    public Collectable(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
    }

    @Override
    public void Clicked(){
        scene_manager.GetCurrentScene().MarkForRemoval(name);
        inventory.AddItem(name, texture);
    }

}

class SceneManager{
    private HashMap<String, Scene> scenes;
    private String current_scene_name = "";

    public SceneManager(){
        scenes = new HashMap<String, Scene>();
    }

    public void ChangeScene(String target_scene_name){
        if (scenes.containsKey(target_scene_name)){
            current_scene_name = target_scene_name;
        }
        else{
            println(target_scene_name + " scene not found");
        }
    }

    public Scene GetCurrentScene(){
        return scenes.get(current_scene_name);
    }

    public void AddScene(Scene s){
        scenes.put(s.name, s);
        if (current_scene_name == ""){
            current_scene_name = s.name;
        }
    }

}

class InventoryManager{
    private HashMap<String, PImage> items = new HashMap<String, PImage>();
    private String selected_key = "";

    public void AddItem(String name, PImage texture){
        items.put(name, texture);
    }

    public String GetSelectedItem(){
        return selected_key;
    }

    public void RemoveSelectedItem(){
        items.remove(selected_key);
        selected_key = "";
    }

    public void ListItems(){//only for testing purposes
        for (Map.Entry<String, PImage> i : items.entrySet()){
            println(i.getKey());
        }
    }
}
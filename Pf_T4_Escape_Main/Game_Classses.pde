//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.011                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

class Tube extends GameObject{
    PImage crack;
    public Tube(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        crack = loadImage("Assets/crack.png");
    }

    @Override
    public void Clicked(){
        texture = crack;
        texture_size.x = 120;
        texture_size.y = 120;
        conditions.put("is_tube_broken", true);
    }
}

class Rat extends GameObject{
    PImage rat_fed;
    public Rat(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        rat_fed = loadImage("Assets/rat_fed.png");
    }

    @Override
    public void Clicked(){
        texture = rat_fed;
        texture_size = new PVector(300, 200);
        position = new PVector(1200, 600);
        conditions.put("is_rat_fed", true);
    }
}

class Syringe extends GameObject{
    private PImage filled_texture;
    public Syringe(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        filled_texture = loadImage("Assets/syringe_filled.png");
    }

    @Override
    public void Clicked(){
        if (!inventory.HasItem("serum")){
            scene_manager.GetCurrentScene().MarkForRemoval(name);
            inventory.AddItem(name, texture);
        }
        else{
            if (inventory.GetSelectedItem().name == "serum"){
                scene_manager.GetCurrentScene().MarkForRemoval(name);
                inventory.AddItem("syringe_filled", filled_texture);
                inventory.RemoveSelectedItem();
            }
        }
    }
}

class Serum extends GameObject{
    private PImage filled_texture;
    public Serum(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        filled_texture = loadImage("Assets/syringe_filled.png");
    }

    @Override
    public void Clicked(){
        if (!inventory.HasItem("syringe_empty")){
            scene_manager.GetCurrentScene().MarkForRemoval(name);
            inventory.AddItem(name, texture);
        }
        else{
            if (inventory.GetSelectedItem().name == "syringe_empty"){
                scene_manager.GetCurrentScene().MarkForRemoval(name);
                inventory.AddItem("syringe_filled", filled_texture);
                inventory.RemoveSelectedItem();
            }
        }
    }
}

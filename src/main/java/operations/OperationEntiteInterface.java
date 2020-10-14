package operations;

import java.util.List;

public interface OperationEntiteInterface<T> {

    void insertEntite(T entite);
    void deleteEntite(int id);
    void updateEntite(int id);
    List<T> entiteList();
}

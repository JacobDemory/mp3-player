public final class DataStructureSmokeTest {
    private DataStructureSmokeTest() {
    }

    public static void main(String[] args) {
        MyHashTable<String, Integer> table = new MyHashTable<>();
        table.add("first", 1);
        table.add("second", 2);
        table.add("first", 3);

        assert table.size() == 2 : "Updating a key must not increase table size.";
        assert table.get("first") == 3 : "Updated value was not returned.";
        assert table.remove("second") == 2 : "Removed value was not returned.";
        assert table.get("second") == null : "Removed key is still present.";

        MySet set = new MySet();
        assert set.add("track") : "First insertion should change the set.";
        assert !set.add("track") : "Duplicate insertion should not change the set.";
        assert set.size() == 1 : "Set should contain one unique value.";

        System.out.println("All data-structure smoke tests passed.");
    }
}

package com.jomkie.test;

import com.alibaba.fastjson.JSONObject;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

public class TestJomkie {

    public static void main(String[] args) {
        List<TestJoUser> database = new LinkedList<>();

        TestJoUser root1 = new TestJoUser("1", "-1", "根1");
            TestJoUser child1_1 = new TestJoUser("1_1", "1", "子1_1");
                TestJoUser child1_1_1 = new TestJoUser("1_1_1", "1_1", "子1_1_1");
                TestJoUser child1_1_2 = new TestJoUser("1_1_2", "1_1", "子1_1_2");
            TestJoUser child1_2 = new TestJoUser("1_2", "1", "子1_2");
                TestJoUser child1_2_1 = new TestJoUser("1_2_1", "1_2", "子1_2_1");
                TestJoUser child1_2_2 = new TestJoUser("1_2_2", "1_2", "子1_2_2");

        TestJoUser root2 = new TestJoUser("2", "-1", "根2");
            TestJoUser child2_1 = new TestJoUser("2_1", "2", "子2_1");
                TestJoUser child2_1_1 = new TestJoUser("2_1_1", "2_1", "子2_1_1");
                TestJoUser child2_1_2 = new TestJoUser("2_1_2", "2_1", "子2_1_2");
            TestJoUser child2_2 = new TestJoUser("2_2", "2", "子2_2");
                TestJoUser child2_2_1 = new TestJoUser("2_2_1", "2_2", "子2_2_1");
                TestJoUser child2_2_2 = new TestJoUser("2_2_2", "2_2", "子2_2_2");

        TestJoUser root3 = new TestJoUser("3", "-1", "根3");
            TestJoUser child3_1 = new TestJoUser("3_1", "3", "子3_1");
                TestJoUser child3_1_1 = new TestJoUser("3_1_1", "3_1", "子3_1_1");
                TestJoUser child3_1_2 = new TestJoUser("3_1_2", "3_1", "子3_1_2");
            TestJoUser child3_2 = new TestJoUser("3_2", "3", "子3_2");
                TestJoUser child3_2_1 = new TestJoUser("3_2_1", "3_2", "子3_2_1");
                TestJoUser child3_2_2 = new TestJoUser("3_2_2", "3_2", "子3_2_2");

        database.add(root1);
            database.add(child1_1);
                database.add(child1_1_1);
                database.add(child1_1_2);
            database.add(child1_2);
                database.add(child1_2_1);
                database.add(child1_2_2);

        database.add(root2);
            database.add(child2_1);
                database.add(child2_1_1);
                database.add(child2_1_2);
            database.add(child2_2);
                database.add(child2_2_1);
                database.add(child2_2_2);

        database.add(root3);
            database.add(child3_1);
                database.add(child3_1_1);
                database.add(child3_1_2);
            database.add(child3_2);
                database.add(child3_2_1);
                database.add(child3_2_2);

        Function<TestJoUser, String> acquireIdentifierOfItSelfFunction = TestJoUser::getId;
        Function<String, List<TestJoUser>> acquireChildsByParentIdentifierFunction = (parentId) -> {
            List<TestJoUser> result = new LinkedList<>();
            for (int i = 0; i < database.size(); i ++) {
                if (parentId.equals(database.get(i).getParentId())) {
                    result.add(database.get(i));
                }
            }
            return result;
        };
        BiConsumer<TestJoUser, List<TestJoUser>> setChildFunction = (obj, childs) -> {
            if (obj.getChilds() == null) {
                obj.setChilds(new ArrayList<>());
            }

            obj.getChilds().addAll(childs);
        };

        List<TestJoUser> rootList = new ArrayList<>();
        rootList.add(root1);
        rootList.add(root2);
        rootList.add(root3);

        TreeTool<TestJoUser, String> treeTool = new TreeTool<>(
                acquireIdentifierOfItSelfFunction,
                acquireChildsByParentIdentifierFunction,
                setChildFunction
        );
        treeTool.getTree(1, rootList);
        String jsonStr = JSONObject.toJSONString(rootList);
        System.out.println(jsonStr);
    }

}

package com.yunxi.waste.common.manager.utils;

import com.humi.cloud.common.exception.HumiRuntimeException;
import com.humi.cloud.common.model.ResponseCode;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.util.CollectionUtils;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.function.BiConsumer;
import java.util.function.Function;

/**
 * @author Jomkie
 * @since 2021-06-01 16:44:0
 * <Obj> 一个树的元素
 * <ParentIdentifier> 通过元素获取的唯一父级标识
 * 获取树
 */
@NoArgsConstructor
@Data
public class TreeTool<Obj, ParentIdentifier> {

    /** 通过对象获取 父类标识 */
    Function<Obj, ParentIdentifier> acquireParentIdentifierFunction;

    /** 通过父类标识获取对应的子级对象集合 */
    Function<ParentIdentifier, List<Obj>> acquireChildsByParentIdentifierFunction;

    /** 为对象设置子级对象 */
    BiConsumer<Obj, List<Obj>> setChildFunction;

    public TreeTool(Function<Obj, ParentIdentifier> acquireParentIdentifierFunction,
                    Function<ParentIdentifier, List<Obj>> acquireChildsByParentIdentifierFunction,
                    BiConsumer<Obj, List<Obj>> setChildFunction) {
        this.acquireParentIdentifierFunction = acquireParentIdentifierFunction;
        this.acquireChildsByParentIdentifierFunction = acquireChildsByParentIdentifierFunction;
        this.setChildFunction = setChildFunction;
    }

    /**
     * @author Jomkie
     * @since 2021-06-01 16:45:12
     * @param depth 树的深度，最低为 1
     * @param rootList 树的顶级元素集合
     * 层序遍历获取树
     */
    public List<Obj> getTree(int depth, List<Obj> rootList) {
        // TODO 逻辑未验证，可能有问题
        if (depth <= 0) { throw new HumiRuntimeException(ResponseCode.FAILED, "深度至少为1"); }
        if (CollectionUtils.isEmpty(rootList)) { throw new HumiRuntimeException(ResponseCode.FAILED, "顶级元素集合不能为空"); }

        Queue<Obj> queue = new LinkedList<>();
        rootList.forEach(queue::add);

        int currentDepth = 1;
        int numbersForCurrentLayer = rootList.size();
        while ( ! CollectionUtils.isEmpty(queue)) {
            if (currentDepth >= depth) { return rootList; }

            Obj currentObj = queue.poll();
            ParentIdentifier parentIdentifier = acquireParentIdentifierFunction.apply(currentObj);
            List<Obj> childs = acquireChildsByParentIdentifierFunction.apply(parentIdentifier);
            if ( ! CollectionUtils.isEmpty(childs)) {
                childs.forEach(queue::add);
                setChildFunction.accept(currentObj, childs);
            }

            -- numbersForCurrentLayer;
            if (numbersForCurrentLayer <= 0) {
                currentDepth ++;
                numbersForCurrentLayer = queue.size();
            }
        }

        return rootList;
    }

}

deferred class AVL_TREE[E_ -> COMPARABLE]
	--
	-- Definition of a mathematical set of comparable objects. All common
	-- operations on mathematical sets are available.
	--

insert
	AVL_CONSTANTS

feature {ANY}
	debug_string: STRING is
		do
			if root = Void then
				Result := once "Void"
			else
				Result := tagged_out_memory
				Result.clear_count
				root.out_in_tagged_out_memory
			end
		end

	count: INTEGER

feature {ANY} -- Adding and removing:
	remove (e: E_) is
		do
			root := do_remove(root, e)
		end

	fast_remove (e: E_) is
		do
			root := fast_do_remove(root, e)
		end

feature {}
	root: like a_new_node

	rebalance: BOOLEAN

	item_memory: E_

	set_value_and_key (n: like a_new_node) is
		deferred
		end

	set_value (n: like a_new_node) is
		deferred
		end

	fast_do_insert (n: like a_new_node): like a_new_node is
		do
			if n = Void then
				Result := new_node
				set_value_and_key(Result)
				count := count + 1
				map_dirty := True
				rebalance := True
			elseif item_memory = n.item then
				Result := n
				set_value(Result)
				rebalance := False
			elseif item_memory < n.item then
				n.set_left(do_insert(n.left))
				if rebalance then
					Result := left_grown(n)
				else
					Result := n
				end
			else
				check
					item_memory > n.item
				end
				n.set_right(do_insert(n.right))
				if rebalance then
					Result := right_grown(n)
				else
					Result := n
				end
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) > old node_height(n))
		end

	do_insert (n: like a_new_node): like a_new_node is
		do
			if n = Void then
				Result := new_node
				set_value_and_key(Result)
				count := count + 1
				map_dirty := True
				rebalance := True
			elseif item_memory < n.item then
				n.set_left(do_insert(n.left))
				if rebalance then
					Result := left_grown(n)
				else
					Result := n
				end
			elseif item_memory > n.item then
				n.set_right(do_insert(n.right))
				if rebalance then
					Result := right_grown(n)
				else
					Result := n
				end
			else
				check
					item_memory.is_equal(n.item)
				end
				Result := n
				set_value(Result)
				rebalance := False
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) > old node_height(n))
		end

	left_grown (n: like a_new_node): like a_new_node is
		require
			rebalance
			n /= Void
			node_height(n.right) - node_height(n.left) + 1 = n.balance
		do
			inspect
				n.balance
			when imbalanced_left then
				if n.left.balance = imbalanced_left then
					n.set_balance(balanced)
					n.left.set_balance(balanced)
				else
					inspect
						n.left.right.balance
					when imbalanced_left then
						n.set_balance(imbalanced_right)
						n.left.set_balance(balanced)
					when balanced then
						n.set_balance(balanced)
						n.left.set_balance(balanced)
					when imbalanced_right then
						n.set_balance(balanced)
						n.left.set_balance(imbalanced_left)
					end
					n.left.right.set_balance(balanced)
					n.set_left(n.left.rotate_left)
				end
				Result := n.rotate_right
				rebalance := False
			when balanced then
				n.set_balance(imbalanced_left)
				Result := n
			when imbalanced_right then
				n.set_balance(balanced)
				Result := n
				rebalance := False
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) > 1 + old node_height(n.right).max(node_height(n.left) - 1))
		end

	right_grown (n: like a_new_node): like a_new_node is
		require
			rebalance
			n /= Void
			node_height(n.right) - 1 - node_height(n.left) = n.balance
		do
			inspect
				n.balance
			when imbalanced_right then
				if n.right.balance = imbalanced_right then
					n.set_balance(balanced)
					n.right.set_balance(balanced)
				else
					inspect
						n.right.left.balance
					when imbalanced_right then
						n.set_balance(imbalanced_left)
						n.right.set_balance(balanced)
					when balanced then
						n.set_balance(balanced)
						n.right.set_balance(balanced)
					when imbalanced_left then
						n.set_balance(balanced)
						n.right.set_balance(imbalanced_right)
					end
					n.right.left.set_balance(balanced)
					n.set_right(n.right.rotate_right)
				end
				Result := n.rotate_left
				rebalance := False
			when balanced then
				n.set_balance(imbalanced_right)
				Result := n
			when imbalanced_left then
				n.set_balance(balanced)
				Result := n
				rebalance := False
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) > 1 + old node_height(n.left).max(node_height(n.right) - 1))
		end

	fast_do_remove (n: like a_new_node; e: E_): like a_new_node is
		do
			if n = Void then
				rebalance := False
			elseif e = n.item then
				if n.left = Void then
					Result := n.right
					exchange_and_discard(n, n)
				elseif n.right = Void then
					Result := n.left
					exchange_and_discard(n, n)
				else
					n.set_left(remove_right(n, n.left))
					if rebalance then
						Result := left_shrunk(n)
					else
						Result := n
					end
				end
			elseif e < n.item then
				n.set_left(do_remove(n.left, e))
				if rebalance then
					Result := left_shrunk(n)
				else
					Result := n
				end
			else
				check
					e > n.item
				end
				n.set_right(do_remove(n.right, e))
				if rebalance then
					Result := right_shrunk(n)
				else
					Result := n
				end
			end
		ensure
			Result = Void or else Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) < old node_height(n))
		end

	do_remove (n: like a_new_node; e: E_): like a_new_node is
		do
			if n = Void then
				rebalance := False
			elseif e < n.item then
				n.set_left(do_remove(n.left, e))
				if rebalance then
					Result := left_shrunk(n)
				else
					Result := n
				end
			elseif e > n.item then
				n.set_right(do_remove(n.right, e))
				if rebalance then
					Result := right_shrunk(n)
				else
					Result := n
				end
			elseif n.left = Void then
				Result := n.right
				exchange_and_discard(n, n)
			elseif n.right = Void then
				Result := n.left
				exchange_and_discard(n, n)
			else
				n.set_left(remove_right(n, n.left))
				if rebalance then
					Result := left_shrunk(n)
				else
					Result := n
				end
			end
		ensure
			Result = Void or else Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) < old node_height(n))
		end

	remove_right (n1, n2: like a_new_node): like a_new_node is
		require
			n1 /= Void
			n2 /= Void
		do
			if n2.right = Void then
				Result := n2.left
				exchange_and_discard(n1, n2)
			else
				n2.set_right(remove_right(n1, n2.right))
				if rebalance then
					Result := right_shrunk(n2)
				else
					Result := n2
				end
			end
		ensure
			Result = Void or else Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) < old node_height(n2))
		end

	left_shrunk (n: like a_new_node): like a_new_node is
		require
			rebalance
			n /= Void
			node_height(n.right) - node_height(n.left) - 1 = n.balance
		do
			inspect
				n.balance
			when imbalanced_left then
				n.set_balance(balanced)
				Result := n
			when balanced then
				n.set_balance(imbalanced_right)
				Result := n
				rebalance := False
			when imbalanced_right then
				inspect
					n.right.balance
				when imbalanced_left then
					inspect
						n.right.left.balance
					when imbalanced_left then
						n.set_balance(balanced)
						n.right.set_balance(imbalanced_right)
					when balanced then
						n.set_balance(balanced)
						n.right.set_balance(balanced)
					when imbalanced_right then
						n.set_balance(imbalanced_left)
						n.right.set_balance(balanced)
					end
					n.right.left.set_balance(balanced)
					n.set_right(n.right.rotate_right)
				when balanced then
					n.set_balance(imbalanced_right)
					n.right.set_balance(imbalanced_left)
					rebalance := False
				when imbalanced_right then
					n.set_balance(balanced)
					n.right.set_balance(balanced)
				end
				Result := n.rotate_left
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) < 1 + old node_height(n.right).max(node_height(n.left) + 1))
		end

	right_shrunk (n: like a_new_node): like a_new_node is
		require
			rebalance
			n /= Void
			node_height(n.right) + 1 - node_height(n.left) = n.balance
		do
			inspect
				n.balance
			when imbalanced_right then
				n.set_balance(balanced)
				Result := n
			when balanced then
				n.set_balance(imbalanced_left)
				Result := n
				rebalance := False
			when imbalanced_left then
				inspect
					n.left.balance
				when imbalanced_right then
					inspect
						n.left.right.balance
					when imbalanced_right then
						n.set_balance(balanced)
						n.left.set_balance(imbalanced_left)
					when balanced then
						n.set_balance(balanced)
						n.left.set_balance(balanced)
					when imbalanced_left then
						n.set_balance(imbalanced_right)
						n.left.set_balance(balanced)
					end
					n.left.right.set_balance(balanced)
					n.set_left(n.left.rotate_left)
				when balanced then
					n.set_balance(imbalanced_left)
					n.left.set_balance(imbalanced_right)
					rebalance := False
				when imbalanced_left then
					n.set_balance(balanced)
					n.left.set_balance(balanced)
				end
				Result := n.rotate_right
			end
		ensure
			Result /= Void
			Result.balance = node_height(Result.right) - node_height(Result.left)
			rebalance = (node_height(Result) < 1 + old node_height(n.left).max(node_height(n.right) + 1))
		end

	exchange_and_discard (n1, n2: like a_new_node) is
		require
			n1 /= Void
			n2 /= Void
		deferred
		ensure
			map_dirty
			count = old count - 1
			rebalance
		end

	clear_nodes (node: like a_new_node) is
		do
			if node.left /= Void then
				clear_nodes(node.left)
			end
			if node.right /= Void then
				clear_nodes(node.right)
			end
			discard_node(node)
		end

	node_height (node: like a_new_node): INTEGER is
		do
			if node /= Void then
				Result := node.height
			end
		end

feature {ANY} -- Looking and searching:
	has (e: E_): BOOLEAN is
			-- Is element `e' in the set?
		do
			Result := root /= Void and then root.has(e)
		end

	fast_has (e: E_): BOOLEAN is
			-- Is element `e' in the set?
		do
			Result := root /= Void and then root.fast_has(e)
		end

feature {} -- Iterating internals:
	build_map is
		require
			build_needed: map_dirty
		do
			map.clear_count
			if count > 0 then
				root.map_in(map)
			end
			map_dirty := False
		ensure
			build_done: not map_dirty
		end

	map: FAST_ARRAY[like a_new_node]
			-- Elements in a row for iteration. See `build_map'.

	map_dirty: BOOLEAN
			-- True when the map needs to be built again for the iterators. See
			-- `build_map'.

feature {}
	new_node: like a_new_node is
		do
			Result := lost_nodes.item
			if Result = Void then
				Result := a_new_node
			else
				lost_nodes.set_item(Result.left)
			end
		end

	a_new_node: AVL_TREE_NODE[E_] is
		deferred
		end

	discard_node (n: like a_new_node) is
		require
			n /= Void
		deferred
		end

	lost_nodes: WEAK_REFERENCE[like a_new_node]

invariant
	map /= Void
	not map_dirty implies map.count = count
	count > 0 implies root /= Void and then root.count = count

end -- class AVL_TREE

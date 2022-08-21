;; bepo.nvim: bepo mapping for neovim
;; Copyright 2022 Clément Joly
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;

(local fennel (require :fennel))

(fn ==== []
  (print (string.rep "=" 80)))

(fn ---- []
  (print (string.rep "-" 80)))

(fn right-align [str max]
  (let [len (length str)]
    (.. str (string.rep " " (- max len)))))

(fn print-mapping-struct [struct]
  (match struct
    {: bepo : modes : qwerty}
    (print (string.format "%6s %5s     %s" modes bepo qwerty))
    _ (error (.. "Received an invalid struct" (fennel.view struct)))))

(fn print-lua-import [name]
  (->> (values (right-align (string.format "require(\"bepo\").%s()" name) 46)
               (.. :*bepo.nvim- name "*"))
       (string.format "%s %35s")
       (print)))

(set _G.gen-doc true)
(local bepo (require :fnl/bepo))

;; Content of the help file
(print "*bepo.nvim*       mappings for the bépo layout <https://bepo.fr>



Author:   Clément Joly <https://cj.rs/contact>
Homepage: <https://cj.rs/bepo-nvim>
License:  APACHE license


                                      Type |gO| to see the table of contents.
")

(====)

(print "USAGE                                                            *bepo.nvim-usage*

For a basic setup with all mappings defined, just add the following to your
init.lua:
                                                                 *bepo.nvim-setup*

    require(\"bepo\").setup()

See |bepo.nvim-cherry-pick| to apply only some groups of mapping. By default,
setup() applies all mapping groups.
")

(print "                                                           *bepo.nvim-always-free*")

(print (fennel.metadata:get bepo.setup :fnl/docstring))
(print "")

(====)
(print "MAPPING CHERRY-PICK                                        *bepo.nvim-cherry-pick*

You can also pick only some groups of mapping, for instance because you have
your own preferences for some key that don’t match this extension. To apply
only the “window” and “movement” groups of mapping, use this instead of
|bepo.nvim-setup| in your init.lua:

    require(\"bepo\").movement()
    require(\"bepo\").window()

The following subsections go into details of exactly what mappings are
in each group. “Modes” have the same meaning as in the |map-table|.
")

(let [tbl (collect [name docstruct (pairs bepo)]
            (if (= name :setup)
                nil
                (values name docstruct)))]
  (do
    (table.sort tbl)
    (each [name docstruct (pairs tbl)]
      (do
        (----)
        (print-lua-import name)
        (-?> docstruct (?. :docstring) print)
        (print "")
        (if (> (length docstruct.body) 0)
            (print-mapping-struct {:bepo :Bepo :modes :Modes :qwerty :Qwerty}))
        (each [_ mapping-struct (pairs docstruct.body)]
          (match mapping-struct
            {:comment c} (print c)
            _ (print-mapping-struct mapping-struct)))
        (print "")))))

;; We split the vim and the : to prevent vim from picking up that for the fennel file
(print (.. "\nvim" ":tw=78:ts=8:ft=help:norl:"))


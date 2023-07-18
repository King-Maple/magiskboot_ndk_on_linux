# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under both the MIT license found in the
# LICENSE-MIT file in the root directory of this source tree and the Apache
# License, Version 2.0 found in the LICENSE-APACHE file in the root directory
# of this source tree.

# TODO(cjhopman): This was generated by scripts/hacks/rules_shim_with_docs.py,
# but should be manually edited going forward. There may be some errors in
# the generated docs, and so those should be verified to be accurate and
# well-formatted (and then delete this TODO)

load(":common.bzl", "AbiGenerationMode", "LogLevel", "SourceAbiVerificationMode", "TestType", "UnusedDependenciesAction", "buck", "prelude_rule")
load(":jvm_common.bzl", "jvm_common")

Style = ["obf", "pretty", "detailed"]

gwt_binary = prelude_rule(
    name = "gwt_binary",
    docs = "",
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "deps": attrs.list(attrs.dep(), default = []),
            "draft_compile": attrs.option(attrs.bool(), default = None),
            "experimental_args": attrs.list(attrs.string(), default = []),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "local_workers": attrs.option(attrs.int(), default = None),
            "module_deps": attrs.list(attrs.dep(), default = []),
            "modules": attrs.list(attrs.string(), default = []),
            "optimize": attrs.option(attrs.int(), default = None),
            "strict": attrs.option(attrs.bool(), default = None),
            "style": attrs.option(attrs.enum(Style), default = None),
            "vm_args": attrs.list(attrs.string(), default = []),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

jar_genrule = prelude_rule(
    name = "jar_genrule",
    docs = "",
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "bash": attrs.option(attrs.arg(), default = None),
            "cacheable": attrs.option(attrs.bool(), default = None),
            "cmd": attrs.option(attrs.arg(), default = None),
            "cmd_exe": attrs.option(attrs.arg(), default = None),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "enable_sandbox": attrs.option(attrs.bool(), default = None),
            "environment_expansion_separator": attrs.option(attrs.string(), default = None),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "need_android_tools": attrs.bool(default = False),
            "remote": attrs.option(attrs.bool(), default = None),
            "srcs": attrs.named_set(attrs.source(), sorted = False, default = []),
            "type": attrs.option(attrs.string(), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_annotation_processor = prelude_rule(
    name = "java_annotation_processor",
    docs = "",
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "deps": attrs.list(attrs.dep(), default = []),
            "does_not_affect_abi": attrs.bool(default = False),
            "isolate_class_loader": attrs.bool(default = False),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "processor_class": attrs.string(default = ""),
            "supports_abi_generation_from_source": attrs.bool(default = False),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_binary = prelude_rule(
    name = "java_binary",
    docs = """
        A `java_binary()` rule is used to create a JAR file of the
        compiled .class files and resources of the `java_library()`
         rules on which it depends.
    """,
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "deps": attrs.list(attrs.dep(), default = [], doc = """
                Rules (normally of type `java_library`) that should be
                 compiled and whose `.class` files and resources should be
                 included in the generated JAR file.
            """),
            "main_class": attrs.option(attrs.string(), default = None, doc = """
                If provided, this will be the value specified as the
                 `Main-Class` attribute of the `META-INF/MANIFEST.MF`
                 file in the generated JAR file. Also, when this rule is used as
                 an executable in a `genrule()`,
                 `main_class` will indicate the class whose `main()` method will be invoked to process the command-line arguments. This
                 is consistent with the expected usage of `java -jar
                 *<name.jar>* *<args>*`.
            """),
            "manifest_file": attrs.option(attrs.source(), default = None, doc = """
                If provided, this manifest will be used when generating the JAR
                 file. If combined with `main_class`, the specified manifest
                 file will be used but the `main_class` will override the main
                 class in the manifest.
            """),
            "meta_inf_directory": attrs.option(attrs.source(), default = None, doc = """
                Note: This has beta support currently.
                 If provided, the contents in this directory will end up in the
                 `META-INF` directory inside the generated JAR file.
            """),
            "blacklist": attrs.list(attrs.regex(), default = [], doc = """
                A list of patterns that identify files to exclude from the final generated JAR
                 file. Example:


                ```

                java_binary(
                  name = 'example',
                  blacklist = [
                    # Excludes com.example.A and com.example.Alligator,
                    # as well as their inner classes and any non-class files that happen to match
                    # the pattern
                    'com.example.A',

                    # Excludes all files from org/slf4j/**/*.
                    'org.slf4j',
                  ],
                  deps = [
                    ':example1',
                    ':third-party-stuff',
                  ],
                )

                ```
            """),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_cxx_platform": attrs.option(attrs.string(), default = None),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "generate_wrapper": attrs.bool(default = False),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_library = prelude_rule(
    name = "java_library",
    docs = """
        A `java_library()` rule defines a set of Java
        files that can be compiled together. The main output of a
         `java_library()` rule is a single JAR file containing all
        of the compiled class files, as well as the static files specified in
        the `resources` argument.
    """,
    examples = """
        ```

        # A rule that compiles a single .java file.
        java_library(
          name = 'JsonUtil',
          srcs = ['JsonUtil.java'],
          deps = [
            '//third_party/guava:guava',
            '//third_party/jackson:jackson',
          ],
        )

        # A rule that compiles all of the .java files under the directory in
        # which the rule is defined using glob(). It also excludes an
        # individual file that may have additional dependencies, so it is
        # compiled by a separate rule.
        java_library(
          name = 'messenger',
          srcs = glob(['**/*.java'], excludes = ['MessengerModule.java']),
          deps = [
            '//src/com/facebook/base:base',
            '//third_party/guava:guava',
          ],
        )

        java_library(
          name = 'MessengerModule',
          srcs = ['MessengerModule.java'],
          deps = [
            '//src/com/facebook/base:base',
            '//src/com/google/inject:inject',
            '//third_party/guava:guava',
            '//third_party/jsr-330:jsr-330',
          ],
        )

        # A rule that builds a library with both relative and
        # fully-qualified deps.
        java_library(
          name = 'testutil',
          srcs = glob(['tests/**/*.java'], excludes = 'tests/**/*Test.java'),
          deps = [
            ':lib-fb4a',
            '//java/com/facebook/base:base',
          ],
        )

        ```
    """,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "srcs": attrs.list(attrs.source(), default = [], doc = """
                The set of `.java` files to compile for this rule.
                 If any of the files in this list end in `.src.zip`,
                 then the entries in the ZIP file that end in `.java` will be
                 included as ordinary inputs to compilation. This is common when using
                 a `genrule()`to auto-generate some Java source code that
                 needs to be compiled with some hand-written Java code.
            """),
        } |
        jvm_common.resources_arg() |
        {
            "deps": attrs.list(attrs.dep(), default = [], doc = """
                Rules (usually other `java_library` rules) that are used to
                 generate the classpath required to compile this `java_library`.
            """),
            "source": attrs.option(attrs.string(), default = None, doc = """
                Specifies the version of Java (as a string) to interpret source
                 files as.
                 Overrides the value in "source\\_level" in the "java" section
                 of `.buckconfig`.
            """),
            "target": attrs.option(attrs.string(), default = None, doc = """
                Specifies the version of Java (as a string) for which to
                 generate code.
                 Overrides the value in "target\\_level" in the "java" section
                 of `.buckconfig`.
            """),
            "java_version": attrs.option(attrs.string(), default = None, doc = """
                Equivalent to setting both `source` and `target`  to the given value. Setting this and `source` or `target` (or both!) is an error.
            """),
            "javac": attrs.option(attrs.source(), default = None, doc = """
                Specifies the Java compiler program to use for this rule.
                 The value is a source path (e.g., //foo/bar:bar).
                 Overrides the value in "javac" in the "tools" section
                 of `.buckconfig`.
            """),
            "extra_arguments": attrs.list(attrs.string(), default = [], doc = """
                List of additional arguments to pass into the Java compiler. These
                 arguments follow the ones specified in `.buckconfig`.
            """),
        } |
        jvm_common.remove_classes_arg() |
        jvm_common.exported_deps() |
        jvm_common.provided_deps() |
        jvm_common.exported_provided_deps() |
        jvm_common.abi_generation_mode() |
        jvm_common.source_only_abi_deps() |
        jvm_common.required_for_source_only_abi() |
        jvm_common.on_unused_dependencies() |
        {
            "annotation_processor_deps": attrs.list(attrs.dep(), default = []),
            "annotation_processor_params": attrs.list(attrs.string(), default = []),
            "annotation_processors": attrs.list(attrs.string(), default = []),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "manifest_file": attrs.option(attrs.source(), default = None),
            "maven_coords": attrs.option(attrs.string(), default = None),
            "never_mark_as_unused_dependency": attrs.option(attrs.bool(), default = None),
            "plugins": attrs.list(attrs.dep(), default = []),
            "proguard_config": attrs.option(attrs.source(), default = None),
            "runtime_deps": attrs.list(attrs.dep(), default = []),
            "source_abi_verification_mode": attrs.option(attrs.enum(SourceAbiVerificationMode), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_plugin = prelude_rule(
    name = "java_plugin",
    docs = "",
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "deps": attrs.list(attrs.dep(), default = []),
            "does_not_affect_abi": attrs.bool(default = False),
            "isolate_class_loader": attrs.bool(default = False),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "plugin_name": attrs.string(default = ""),
            "supports_abi_generation_from_source": attrs.bool(default = False),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_test = prelude_rule(
    name = "java_test",
    docs = """
        A `java_test()` rule is used to define a set of
         `.java` files that contain tests to run via JUnit.
    """,
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "srcs": attrs.list(attrs.source(), default = [], doc = """
                Like `java_library()`,
                 all of the `.java` files specified by the
                 `srcs` argument will be compiled when this rule is
                 built. In addition, all of the corresponding `.class` files that are built by this rule will be passed as arguments to
                 JUnit when this rule is run as a test. `.class` files
                 that are passed to JUnit that do not have any methods annotated with
                 `@Test` are considered failed tests, so make sure that
                 only test case classes are specified as `srcs`. This is
                 frequently done by specifying `srcs` as
                 `glob(['**/*Test.java'])`.
            """),
            "resources": attrs.list(attrs.source(), default = [], doc = """
                Same as `java_library()`.
            """),
        } |
        buck.test_label_arg() |
        {
            "source": attrs.option(attrs.string(), default = None, doc = """
                Java language level for compiling. Corresponds to the
                 `-source` argument for `javac`.
            """),
            "target": attrs.option(attrs.string(), default = None, doc = """
                Bytecode target level for compiling. Corresponds to the
                 `-target` argument for `javac`.
            """),
            "deps": attrs.list(attrs.dep(), default = [], doc = """
                Same as `java_library()`.
                 // org.junit.rules.Timeout was not introduced until 4.7.
                 Must include JUnit (version 4.7 or later) as a dependency for JUnit tests.
                 Must include TestNG (version 6.2 or later) and hamcrest as a dependencies for TestNG tests.
            """),
            "test_type": attrs.option(attrs.enum(TestType), default = None, doc = """
                Specifies which test framework to use.
                 The currently supported options are 'junit' and 'testng'.
            """),
        } |
        buck.run_test_separately_arg(run_test_separately_type = attrs.bool(default = False)) |
        buck.fork_mode() |
        buck.test_rule_timeout_ms() |
        {
            "std_out_log_level": attrs.option(attrs.one_of(attrs.enum(LogLevel), attrs.int()), default = None, doc = """
                Log level for messages from the source under test that buck will output to
                 std out.
                 Value must be a valid `java.util.logging.Level` value.
            """),
            "std_err_log_level": attrs.option(attrs.one_of(attrs.enum(LogLevel), attrs.int()), default = None, doc = """
                Same as `std_out_log_level`, but for std err.
            """),
            "use_cxx_libraries": attrs.option(attrs.bool(), default = None, doc = """
                Whether or not to build and link against `cxx\\_library()`dependencies when testing.
            """),
            "cxx_library_whitelist": attrs.list(attrs.dep(), default = [], doc = """
                EXPERIMENTAL.
                 List of cxx\\_libraries to build, if use\\_cxx\\_libraries is true.
                 This can be useful if some dependencies are Android-only and won't build on the default platform.
            """),
            "vm_args": attrs.list(attrs.arg(), default = [], doc = """
                Runtime arguments to the JVM running the tests.
            """),
        } |
        jvm_common.test_env() |
        {
            "abi_generation_mode": attrs.option(attrs.enum(AbiGenerationMode), default = None),
            "annotation_processor_deps": attrs.list(attrs.dep(), default = []),
            "annotation_processor_params": attrs.list(attrs.string(), default = []),
            "annotation_processors": attrs.list(attrs.string(), default = []),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_cxx_platform": attrs.option(attrs.string(), default = None),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "deps_query": attrs.option(attrs.query(), default = None),
            "exported_deps": attrs.list(attrs.dep(), default = []),
            "exported_provided_deps": attrs.list(attrs.dep(), default = []),
            "extra_arguments": attrs.list(attrs.string(), default = []),
            "java_version": attrs.option(attrs.string(), default = None),
            "javac": attrs.option(attrs.source(), default = None),
            "licenses": attrs.list(attrs.source(), default = []),
            "manifest_file": attrs.option(attrs.source(), default = None),
            "maven_coords": attrs.option(attrs.string(), default = None),
            "never_mark_as_unused_dependency": attrs.option(attrs.bool(), default = None),
            "on_unused_dependencies": attrs.option(attrs.enum(UnusedDependenciesAction), default = None),
            "plugins": attrs.list(attrs.dep(), default = []),
            "proguard_config": attrs.option(attrs.source(), default = None),
            "provided_deps": attrs.list(attrs.dep(), default = []),
            "remove_classes": attrs.list(attrs.regex(), default = []),
            "required_for_source_only_abi": attrs.bool(default = False),
            "resources_root": attrs.option(attrs.source(), default = None),
            "runner": attrs.option(attrs.dep(), default = None),
            "runtime_deps": attrs.list(attrs.dep(), default = []),
            "source_abi_verification_mode": attrs.option(attrs.enum(SourceAbiVerificationMode), default = None),
            "source_only_abi_deps": attrs.list(attrs.dep(), default = []),
            "specs": attrs.option(attrs.arg(json = True), default = None),
            "test_case_timeout_ms": attrs.option(attrs.int(), default = None),
            "use_dependency_order_classpath": attrs.option(attrs.bool(), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_test_runner = prelude_rule(
    name = "java_test_runner",
    docs = "",
    examples = None,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "abi_generation_mode": attrs.option(attrs.enum(AbiGenerationMode), default = None),
            "annotation_processor_deps": attrs.list(attrs.dep(), default = []),
            "annotation_processor_params": attrs.list(attrs.string(), default = []),
            "annotation_processors": attrs.list(attrs.string(), default = []),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "deps": attrs.list(attrs.dep(), default = []),
            "exported_deps": attrs.list(attrs.dep(), default = []),
            "exported_provided_deps": attrs.list(attrs.dep(), default = []),
            "extra_arguments": attrs.list(attrs.string(), default = []),
            "java_version": attrs.option(attrs.string(), default = None),
            "javac": attrs.option(attrs.source(), default = None),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "main_class": attrs.string(default = ""),
            "manifest_file": attrs.option(attrs.source(), default = None),
            "maven_coords": attrs.option(attrs.string(), default = None),
            "never_mark_as_unused_dependency": attrs.option(attrs.bool(), default = None),
            "on_unused_dependencies": attrs.option(attrs.enum(UnusedDependenciesAction), default = None),
            "plugins": attrs.list(attrs.dep(), default = []),
            "proguard_config": attrs.option(attrs.source(), default = None),
            "provided_deps": attrs.list(attrs.dep(), default = []),
            "remove_classes": attrs.list(attrs.regex(), default = []),
            "required_for_source_only_abi": attrs.bool(default = False),
            "resources": attrs.list(attrs.source(), default = []),
            "resources_root": attrs.option(attrs.source(), default = None),
            "runtime_deps": attrs.list(attrs.dep(), default = []),
            "source": attrs.option(attrs.string(), default = None),
            "source_abi_verification_mode": attrs.option(attrs.enum(SourceAbiVerificationMode), default = None),
            "source_only_abi_deps": attrs.list(attrs.dep(), default = []),
            "srcs": attrs.list(attrs.source(), default = []),
            "target": attrs.option(attrs.string(), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

java_rules = struct(
    gwt_binary = gwt_binary,
    jar_genrule = jar_genrule,
    java_annotation_processor = java_annotation_processor,
    java_binary = java_binary,
    java_library = java_library,
    java_plugin = java_plugin,
    java_test = java_test,
    java_test_runner = java_test_runner,
)